#!/bin/bash
set -euo pipefail

docker build -t getting-started .
docker run -dp 3000:3000 --name getting-started getting-started 