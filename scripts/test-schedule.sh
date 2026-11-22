#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE="${RK_WORKSPACE:-$(dirname "$ROOT")}"
JAVA_DIR="${RK_JAVA_DIR:-/usr/lib/jvm/java-21-openjdk/bin}"
OUT="$WORKSPACE/build/schedule/test"
JSON_JAR="${RK_JSON_JAR:-$WORKSPACE/build/schedule/test-libs/json.jar}"
if [[ ! -f "$JSON_JAR" ]]; then
  echo 'Set RK_JSON_JAR to org.json:json:20240303 (host tests only).'
  exit 1
fi
mkdir -p "$OUT"
"$JAVA_DIR/javac" -encoding UTF-8 -cp "$JSON_JAR" -d "$OUT" "$ROOT"/tests/support/android/content/*.java "$ROOT/mod/java/rk/schedule/ScheduleResolver.java" "$ROOT/mod/java/rk/schedule/ScheduleStore.java" "$ROOT/mod/java/rk/schedule/DiaryContext.java" "$ROOT/mod/java/rk/schedule/WeakIdentityMap.java" "$ROOT/mod/java/rk/diary/PersonalHomeworkStore.java" "$ROOT"/tests/rk/schedule/*Test.java
"$JAVA_DIR/java" -cp "$OUT:$JSON_JAR" rk.schedule.ScheduleResolverTest
"$JAVA_DIR/java" -cp "$OUT:$JSON_JAR" rk.schedule.ScheduleStoreTest

"$JAVA_DIR/java" -cp "$OUT:$JSON_JAR" rk.schedule.DiaryIsolationTest
