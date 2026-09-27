#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
docker compose up -d
echo "Lab started. Forward/open ports 8080 (DVWA) and 3000 (Juice Shop)."
