#!/bin/bash
set -euo pipefail

APP_NAME="getting-started"
TEMP_DIR="tempdir"

# Maak de directory structuur
if [ ! -d "$TEMP_DIR" ]; then
  mkdir "$TEMP_DIR"
fi

# Clone de repo (of kopieer lokaal)
if [ ! -d "$TEMP_DIR/$APP_NAME" ]; then
  git clone https://github.com/docker/getting-started.git "$TEMP_DIR/$APP_NAME"
fi

# Ga naar de app directory
cd "$TEMP_DIR/$APP_NAME" || exit

# Optioneel: maak een Dockerfile als je een aangepaste wilt
cat > Dockerfile << _EOF_
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
_EOF_

# Build de Docker image
docker build -t getting-started-app .

# Run de container
docker run -d -p 3000:3000 --name getting-started-running getting-started-app

# Toon draaiende containers
docker ps -a
