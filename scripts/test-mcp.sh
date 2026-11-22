#!/usr/bin/env bash
# Host test of the MCP server: the real server on 127.0.0.1, real HTTP requests, a diary fed through the app's own bridge.
# Needs build-schedule.sh to have run (it compiles the mod classes) and org.json (RK_JSON_JAR), like test-schedule.sh.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE="${RK_WORKSPACE:-$(dirname "$ROOT")}"
JAVA_DIR="${RK_JAVA_DIR:-/usr/lib/jvm/java-21-openjdk/bin}"
SDK="${ANDROID_SDK_ROOT:-/home/mega/Android/Sdk}"
ANDROID_JAR="${RK_ANDROID_JAR:-$SDK/platforms/android-37.0/android.jar}"
JSON_JAR="${RK_JSON_JAR:-$WORKSPACE/build/schedule/test-libs/json.jar}"
CLASSES="$WORKSPACE/build/schedule/classes"
OUT="$WORKSPACE/build/mcp-test"
rm -rf "$OUT"; mkdir -p "$OUT/stubs" "$OUT/tests"
"$JAVA_DIR/javac" -encoding UTF-8 -d "$OUT/stubs" "$ROOT"/tests/support/hostmcp/android/content/*.java "$ROOT"/tests/support/hostmcp/android/util/*.java "$ROOT"/tests/support/hostmcp/android/os/*.java
"$JAVA_DIR/javac" -encoding UTF-8 -cp "$OUT/stubs:$CLASSES:$JSON_JAR:$ANDROID_JAR" -d "$OUT/tests" \
  "$ROOT/tests/android/la/h.java" "$ROOT/tests/android/la/f.java" "$ROOT/tests/android/la/g.java" "$ROOT/tests/android/ma/b.java" "$ROOT/tests/rk/mcp/McpHostTest.java"
# The test's own stand-ins come first, then the mod classes, then the real org.json (the one in android.jar only has stubs).
"$JAVA_DIR/java" -Djava.net.preferIPv4Stack=true -cp "$OUT/stubs:$OUT/tests:$CLASSES:$JSON_JAR:$ANDROID_JAR" rk.mcp.McpHostTest "$@"
