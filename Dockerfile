FROM python:3.11-slim

WORKDIR /app

# System-Tools installieren
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alle Dateien kopieren
COPY . .

# Installation des Projekts
# Dies installiert auch alle Abhängigkeiten aus der pyproject.toml
RUN pip install --no-cache-dir .

# Python-Ausgabe sofort in die Logs schreiben
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# STARTBEFEHL: Wir rufen das ads_mcp Modul auf.
# Wir sagen ihm: Nutze SSE (Web-Modus), höre auf Port 8080 und auf alle IPs (0.0.0.0).
CMD ["python", "-m", "ads_mcp", "--transport", "sse", "--host", "0.0.0.0", "--port", "8080"]
