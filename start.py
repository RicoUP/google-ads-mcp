import os
import sys

# Füge das aktuelle Verzeichnis zum Python-Pfad hinzu
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

print("--- GOOGLE ADS MCP START-SEQUENZ ---")

try:
    # Importiert die Hauptfunktion des Google-Ads-MCP
    from ads_mcp.server import main
    print("Modul 'ads_mcp' erfolgreich geladen.")

    # Port von Google Cloud Run abgreifen (Standard 8080)
    port = int(os.environ.get("PORT", 8080))

    # Wir simulieren die Befehlszeilen-Argumente für den Web-Modus (SSE)
    # Das ist exakt das, was Cloud Run zum Überleben braucht
    sys.argv = [
        "ads_mcp", 
        "run", 
        "--transport", "sse", 
        "--host", "0.0.0.0", 
        "--port", str(port)
    ]

    print(f"Server wird auf Port {port} im SSE-Modus gestartet...")
    main()

except Exception as e:
    print(f"!!! KRITISCHER FEHLER BEIM START: {e}")
    import traceback
    traceback.print_exc()
    # Beende mit Fehler, damit Cloud Run das Log speichert
    sys.exit(1)
