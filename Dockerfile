FROM python:3.11-slim

WORKDIR /app

# System-Tools installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Projektdateien kopieren
COPY . .

# Installation des Projekts
RUN pip install --no-cache-dir .

# Python-Fehlermeldungen sofort anzeigen
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# STARTBEFEHL: Wir rufen das richtige Modul (ads_mcp.server) auf.
# Wir sagen ihm: Nutze SSE (Web-Modus), höre auf Port 8080 und auf alle IPs (0.0.0.0).
CMD ["python", "-m", "ads_mcp.server", "--transport", "sse", "--host", "0.0.0.0", "--port", "8080"]
