# Building

## Why there is no "build now" command

This repository does not distribute the base APK or its decompiled code, so the contents of `mod/` cannot be assembled into an app on their own. They are add-ons to a specific version of the base APK.

## Process overview

1. Obtain a compatible base APK lawfully.
2. Verify its version and checksum.
3. Decode it with a compatible Apktool version.
4. Apply the mod resources and Smali classes from `mod/`.
5. Apply the hooks documented in [architecture](architecture.md).
6. Build an unsigned APK with Apktool.
7. Zip-align and sign with your own key.
8. Verify the signature and test installation on a separate device or emulator.

Decode example:

```bash
java -jar apktool.jar d app.apk -o decoded
```

Build example:

```bash
java -jar apktool.jar b decoded -o app-unsigned.apk
```

## Schedule system build

The Java sources in `mod/java/rk/schedule` and `mod/java/rk/diary` are compiled separately (Java 8, D8 for API 21) and disassembled into Smali:

```bash
./scripts/build-schedule.sh
python3 scripts/check-schedule-integration.py ../decoded
./scripts/test-schedule.sh
```

`build-schedule.sh` updates only the `rk/schedule` and `rk/diary` packages in `mod/smali/` (published copies) and the working tree. Hook application scripts accept the path to the decoded tree:

```bash
python3 scripts/apply-schedule-hooks.py ../decoded
python3 scripts/apply-diary-ui.py ../decoded
```

Paths can be overridden with `RK_WORKSPACE`, `RK_JAVA_DIR`, `ANDROID_SDK_ROOT`, `RK_ANDROID_JAR`, `RK_BUILD_TOOLS`, `RK_APKTOOL`. Host tests need `org.json:json` via `RK_JSON_JAR`; see [schedule.md](schedule.md) for details.

## Signing

Create a personal keystore once and keep it outside the repository:

```bash
keytool -genkeypair \
  -keystore /secure/location/rk-note-release.jks \
  -alias rk-note \
  -keyalg RSA \
  -keysize 3072 \
  -validity 10000
```

Enter the password interactively and store it in a password manager. Losing the keystore means new APKs can no longer be installed as updates over existing ones. The keystore and passwords are never committed.

## Publication check

```bash
./scripts/check-public.sh
```

The check fails the build if APKs, keystores, keys or credential-like strings are present in the tree.

## Current limitation

Generating ready-to-apply diff patches requires a clean decoded copy of the same base APK version. Until such a copy is restored, this repository documents the injection points instead of shipping an automatic patcher.
