FROM python:3.11-slim

WORKDIR /app

# System-Tools für Python-Pakete
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Alles kopieren
COPY . .

# Installation (installiert das ads_mcp Modul)
RUN pip install --no-cache-dir .

# WICHTIG: Python-Ausgabe sofort anzeigen (für Logs)
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# Wir versuchen den direkten Modul-Start. 
# Viele Python-MCPs starten über den Pfad zur server.py Datei.
# Wenn deine Datei anders heißt (z.B. main.py), ändere "server.py" unten ab.
CMD ["python", "-m", "mcp", "run", "ads_mcp/server.py", "--transport", "sse", "--port", "8080"]
