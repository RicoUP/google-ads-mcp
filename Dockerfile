# Wir nutzen Python 3.11
FROM python:3.11-slim

# Arbeitsverzeichnis
WORKDIR /app

# System-Tools für die Installation von Google Ads Bibliotheken
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alle Dateien kopieren
COPY . .

# Das Projekt installieren (liest pyproject.toml)
RUN pip install --no-cache-dir .

# Python-Ausgabe für die Logs unbeschränkt lassen
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# STARTBEFEHL: Wir rufen die Hauptdatei des Google Ads MCP direkt auf.
# Laut Google-Repository liegt diese unter ads_mcp/server.py
CMD ["python", "ads_mcp/server.py", "--transport", "sse", "--host", "0.0.0.0", "--port", "8080"]
