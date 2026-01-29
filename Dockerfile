FROM python:3.11-slim

WORKDIR /app

# System-Tools
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Dateien kopieren
COPY . .

# Installation des Projekts UND des mcp-Helfers
RUN pip install --no-cache-dir .
RUN pip install --no-cache-dir "mcp[cli]"

# Wichtig für Logs
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# STARTBEFEHL: Wir nutzen den mcp-Helfer direkt. 
# Er startet dein ads_mcp Paket und wandelt es in einen Web-Dienst um.
CMD ["mcp", "run", "ads_mcp/server.py", "--transport", "sse", "--port", "8080"]
