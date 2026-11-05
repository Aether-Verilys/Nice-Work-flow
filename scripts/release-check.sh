#!/usr/bin/env bash
set -euo pipefail
[[ "$1" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo 'Expected vX.Y.Z'; exit 1; }
# Replace with the repository's authoritative version check.
