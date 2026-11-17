#!/usr/bin/env bash
# Standalone runtime checks on an attached Android device; never installs or launches an APK.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE="${RK_WORKSPACE:-$(dirname "$ROOT")}"
JAVA_DIR="${RK_JAVA_DIR:-/home/mega/Applications/android-studio/jbr/bin}"
SDK="${ANDROID_SDK_ROOT:-/home/mega/Android/Sdk}"
ANDROID_JAR="${RK_ANDROID_JAR:-$SDK/platforms/android-37.0/android.jar}"
BUILD_TOOLS="${RK_BUILD_TOOLS:-$SDK/build-tools/36.0.0}"
ADB="${RK_ADB:-$SDK/platform-tools/adb}"
OUT="$WORKSPACE/build/diary-android-test"
mkdir -p "$OUT/classes" "$OUT/dex"
mapfile -t SOURCES < <(find "$ROOT/tests/android" -name '*.java' -print | sort)
"$JAVA_DIR/javac" -encoding UTF-8 -source 8 -target 8 -cp "$ANDROID_JAR:$WORKSPACE/build/schedule/classes" -d "$OUT/classes" "${SOURCES[@]}"
"$JAVA_DIR/jar" cf "$OUT/tests.jar" -C "$OUT/classes" .
JAVA_HOME="$(dirname "$JAVA_DIR")" "$BUILD_TOOLS/d8" --min-api 21 --lib "$ANDROID_JAR" --output "$OUT/dex" "$WORKSPACE/build/schedule/schedule.jar" "$OUT/tests.jar"
REMOTE="/data/local/tmp/rk-note-regression-$$"
"$ADB" shell mkdir -p "$REMOTE"
trap '"$ADB" shell rm -rf "$REMOTE" >/dev/null' EXIT
"$ADB" push "$OUT/dex/classes.dex" "$REMOTE/tests.dex" >/dev/null
"$ADB" shell "CLASSPATH=$REMOTE/tests.dex app_process /system/bin rk.schedule.AndroidRegression $REMOTE/prefs"
