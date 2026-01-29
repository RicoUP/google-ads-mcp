FROM python:3.11-slim

WORKDIR /app

# System-Abhängigkeiten installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alle Dateien kopieren
COPY . .

# Installation des Projekts
RUN pip install --no-cache-dir .

# Python-Ausgabe für die Logs sofort erzwingen
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# STARTBEFEHL: Wir sagen mcp explizit, welches Objekt ("server") in 
# welcher Datei ("ads_mcp/server.py") es als Web-Dienst starten soll.
# Dies verhindert das sofortige Beenden (exit 0).
CMD ["mcp", "run", "ads_mcp/server.py:server", "--transport", "sse", "--port", "8080"]
