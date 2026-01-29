# Nutze Python 3.11
FROM python:3.11-slim

# Arbeitsverzeichnis im Container
WORKDIR /app

# System-Abhängigkeiten installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alle Dateien aus deinem GitHub-Repo in den Container kopieren
COPY . .

# Das Projekt und das MCP-Framework installieren
# Wir installieren mcp[cli], damit der 'run' Befehl verfügbar ist
RUN pip install --no-cache-dir . "mcp[cli]"

# Python-Ausgabe für die Logs sofort erzwingen
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

# Port 8080 nach außen öffnen
EXPOSE 8080

# Unsere neue Start-Datei ausführen
CMD ["python", "start.py"]
