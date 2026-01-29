import os
import sys

# Pfad-Korrektur, damit das Modul ads_mcp gefunden wird
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

print("--- MANUELLER START: GOOGLE ADS MCP ---")

try:
    # Wir importieren das Server-Objekt direkt
    from ads_mcp.server import mcp
    
    # Port von Google Cloud Run (Standard 8080)
    port = int(os.environ.get("PORT", 8080))
    
    print(f"Starte SSE-Server auf Port {port}...")
    
    # Wir starten den Server direkt als SSE-Webdienst
    # host 0.0.0.0 ist lebenswichtig für Cloud Run!
    mcp.run(transport="sse", host="0.0.0.0", port=port)

except Exception as e:
    print(f"!!! FEHLER BEIM START: {e}")
    sys.exit(1)
