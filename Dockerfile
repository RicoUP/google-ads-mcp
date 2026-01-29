FROM python:3.11-slim

RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Installiert das Paket und das MCP-Framework
RUN pip install --no-cache-dir .

ENV PYTHONUNBUFFERED=1
EXPOSE 8080

# Dieser Befehl MUSS ausgeführt werden
CMD ["python", "start.py"]
