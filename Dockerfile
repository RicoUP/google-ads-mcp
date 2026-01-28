# Nutzen von Node.js 20
FROM node:20-slim

# Installiere TypeScript global, falls nötig
RUN npm install -g typescript

WORKDIR /app

# Kopiere alle Dateien (inkl. package.json und tsconfig.json)
COPY . .

# Installiere Abhängigkeiten
RUN npm install

# Baue das Projekt (TypeScript -> JavaScript)
# Das Google-Repo nutzt "build": "tsc"
RUN npm run build

# Port 8080 für Cloud Run
EXPOSE 8080

# Starte den Server. 
# Im Google-Ads-MCP landen die gebauten Dateien im Ordner /dist
CMD ["node", "dist/index.js", "--transport", "sse"]
