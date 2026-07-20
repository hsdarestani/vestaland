#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

cat "$ROOT"/.source/v1.2/source.part.* > "$TMP/source.b64"
base64 --decode "$TMP/source.b64" > "$TMP/vestaland-source-1.2.0.tar.gz"
echo "56298b932db5b4e83a8ee4473165c519d251ce7699f170867657056bf0ab7e39  $TMP/vestaland-source-1.2.0.tar.gz" | sha256sum -c -
tar -xzf "$TMP/vestaland-source-1.2.0.tar.gz" -C "$ROOT" --strip-components=1

echo "Vestaland 1.2 source expanded successfully."
