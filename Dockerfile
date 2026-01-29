FROM python:3.11-slim

WORKDIR /app

# System-Tools
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alle Dateien kopieren
COPY . .

# Installation des Projekts
RUN pip install --no-cache-dir .

# Port-Umgebungsvariable für Google Cloud
ENV PORT=8080
ENV PYTHONUNBUFFERED=1

EXPOSE 8080

# Wir starten jetzt einfach direkt unsere neue Start-Datei
CMD ["python", "start.py"]
