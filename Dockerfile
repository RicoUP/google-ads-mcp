FROM python:3.11-slim

WORKDIR /app

# System-Tools für die Installation
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alle Dateien kopieren
COPY . .

# Installation des Projekts
RUN pip install --no-cache-dir .

# Python-Ausgabe für die Logs sofort erzwingen
ENV PYTHONUNBUFFERED=1

EXPOSE 8080

# Wir starten NUR noch unsere eigene start.py
CMD ["python", "start.py"]
