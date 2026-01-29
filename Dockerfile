FROM python:3.11-slim

WORKDIR /app

# System-Tools
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Dateien kopieren
COPY . .

# Installation des Projekts UND uvicorn
RUN pip install --no-cache-dir . uvicorn

# Wichtig für Logs
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# Start über unsere neue start.py
CMD ["python", "start.py"]
