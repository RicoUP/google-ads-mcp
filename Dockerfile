FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
COPY . .
# Wir installieren das Projekt UND uvicorn
RUN pip install --no-cache-dir . uvicorn
ENV PYTHONUNBUFFERED=1
EXPOSE 8080
CMD ["python", "start.py"]
