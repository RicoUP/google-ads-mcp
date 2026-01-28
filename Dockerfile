# Wir nutzen Python statt Node.js
FROM python:3.11-slim

# Arbeitsverzeichnis festlegen
WORKDIR /app

# System-Abhängigkeiten installieren (für manche Python-Pakete nötig)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Zuerst die Projektdateien kopieren
COPY . .

# Das Python-Projekt und seine Abhängigkeiten installieren
# "pip install ." nutzt die pyproject.toml
RUN pip install --no-cache-dir .

# Port 8080 für Cloud Run
EXPOSE 8080

# Den MCP-Server starten. 
# Wir rufen das Modul "ads_mcp" auf und aktivieren den SSE-Modus.
CMD ["python", "-m", "ads_mcp", "--transport", "sse"]
