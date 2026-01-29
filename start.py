import os
import sys

# Pfad-Korrektur
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

print("--- GOOGLE ADS MCP START-SEQUENZ ---")

try:
    # Wir importieren das MCP-Objekt
    from ads_mcp.server import mcp
    print("Modul 'ads_mcp' und Objekt 'mcp' erfolgreich geladen.")

    # Wir nutzen NUR transport="sse". 
    # Die Bibliothek bindet sich automatisch an 0.0.0.0 und den Port 8080.
    print("Starte SSE-Server...")
    mcp.run(transport="sse")

except Exception as e:
    print(f"!!! KRITISCHER FEHLER BEIM START: {e}")
    import traceback
    traceback.print_exc()
    # Wir beenden mit Fehlercode 1, damit Cloud Run den Absturz bemerkt
    sys.exit(1)
