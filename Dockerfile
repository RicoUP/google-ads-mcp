# Wir nutzen ein schlankes Node.js Image
FROM node:20-slim

# Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere die Paket-Dateien
COPY package*.json ./

# Installiere die Abhängigkeiten
RUN npm install

# Kopiere den Rest des Codes
COPY . .

# Erzeuge den "dist" Ordner (Kompiliert TypeScript zu JavaScript)
RUN npm run build

# Cloud Run nutzt standardmäßig Port 8080
EXPOSE 8080

# Starte den MCP-Server im SSE-Modus (für Web-Zugriff)
CMD ["node", "dist/index.js", "--transport", "sse"]
