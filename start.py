import os
import sys

# Füge das aktuelle Verzeichnis zum Pfad hinzu
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

try:
    from ads_mcp.server import main
    print("Google Ads MCP wird gestartet...")
    # Wir rufen die Hauptfunktion direkt mit den nötigen Argumenten auf
    # Das simuliert den Befehl: python -m ads_mcp run --transport sse ...
    sys.argv = [
        "ads_mcp", 
        "run", 
        "--transport", "sse", 
        "--host", "0.0.0.0", 
        "--port", "8080"
    ]
    main()
except Exception as e:
    print(f"Kritischer Fehler beim Starten: {e}")
    sys.exit(1)
