#!/bin/bash
set -euo pipefail

if [ ! -d "tempdir" ]; then
  mkdir tempdir
fi

cat > app/Dockerfile << _EOF_
FROM node:lts-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]
_EOF_

cd app || exit
docker build -t getting-started .
docker run -dp 3000:3000 getting-started
docker ps -a 
