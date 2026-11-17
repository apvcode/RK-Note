#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

forbidden="$(find "$ROOT" -path "$ROOT/.git" -prune -o -type f \( \
  -name '*.apk' -o -name '*.apks' -o -name '*.aab' -o -name '*.dex' \
  -o -name '*.jks' -o -name '*.keystore' -o -name '*.p12' -o -name '*.pfx' \
  -o -name '*.key' -o -name '.env' -o -name '.env.*' \
\) -print)"

if [[ -n "$forbidden" ]]; then
  echo "Refusing publication: forbidden files found:"
  echo "$forbidden"
  exit 1
fi

if rg -n -i --hidden --glob '!.git/**' \
  'AIza[0-9A-Za-z_-]{30,}|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|client[_-]?secret[[:space:]]*[=:]|password[[:space:]]*[=:]' \
  "$ROOT"; then
  echo "Potential credential material found. Review it before publishing."
  exit 1
fi

echo "Public repository check passed."

