FROM python:3.11-slim

WORKDIR /app

# System-Tools installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Projektdateien kopieren
COPY . .

# Installation (inklusive mcp-CLI)
RUN pip install --no-cache-dir .

# WICHTIG: Python-Ausgabe sofort in die Logs schreiben
ENV PYTHONUNBUFFERED=1

EXPOSE 8080

# STARTBEFEHL: Wir nutzen den MCP-Übersetzer. 
# Dieser sorgt dafür, dass dein Code als Webdienst (SSE) auf Port 8080 aktiv bleibt.
CMD ["mcp", "run", "ads_mcp", "--transport", "sse", "--port", "8080"]
