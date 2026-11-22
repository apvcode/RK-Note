#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE="${RK_WORKSPACE:-$(dirname "$ROOT")}"
JAVA_DIR="${RK_JAVA_DIR:-/usr/lib/jvm/java-21-openjdk/bin}"
SDK="${ANDROID_SDK_ROOT:-/home/mega/Android/Sdk}"
APKTOOL="${RK_APKTOOL:-$WORKSPACE/tools/apktool.jar}"
ANDROID_JAR="${RK_ANDROID_JAR:-$SDK/platforms/android-37.0/android.jar}"
BUILD_TOOLS="${RK_BUILD_TOOLS:-$SDK/build-tools/36.0.0}"
OUT="$WORKSPACE/build/schedule"
if [[ ! -f "$WORKSPACE/decoded/apktool.yml" ]]; then
  echo "Compatible decoded APK not found at $WORKSPACE/decoded"
  exit 1
fi
mkdir -p "$OUT/classes" "$OUT/dex" "$OUT/runner"
find "$OUT/classes" "$OUT/dex" -type f -delete
mapfile -t SOURCES < <(find "$ROOT/mod/java" -name '*.java' -print | sort)
"$JAVA_DIR/javac" -encoding UTF-8 -source 8 -target 8 -classpath "$ANDROID_JAR" -d "$OUT/classes" "${SOURCES[@]}"
"$JAVA_DIR/jar" cf "$OUT/schedule.jar" -C "$OUT/classes" .
JAVA_HOME="$(dirname "$JAVA_DIR")" "$BUILD_TOOLS/d8" --min-api 21 --lib "$ANDROID_JAR" --output "$OUT/dex" "$OUT/schedule.jar"
"$JAVA_DIR/javac" -cp "$APKTOOL" -d "$OUT/runner" "$ROOT/scripts/java/Disassemble.java"
mkdir -p "$OUT/smali"
rm -rf "$OUT/smali/rk/schedule" "$OUT/smali/rk/diary" "$OUT/smali/rk/mcp"
"$JAVA_DIR/java" -cp "$APKTOOL:$OUT/runner" Disassemble "$OUT/dex/classes.dex" "$OUT/smali"
mkdir -p "$ROOT/mod/smali/rk" "$WORKSPACE/decoded/smali_classes3/rk"
# Only these generated packages are managed by this script.
for package in schedule diary mcp; do
  rm -rf "$ROOT/mod/smali/rk/$package" "$WORKSPACE/decoded/smali_classes3/rk/$package"
  if [[ -d "$OUT/smali/rk/$package" ]]; then
    cp -R "$OUT/smali/rk/$package" "$ROOT/mod/smali/rk/"
    cp -R "$OUT/smali/rk/$package" "$WORKSPACE/decoded/smali_classes3/rk/"
  fi
done
echo 'Mod Java compiled and Smali synchronized.'
