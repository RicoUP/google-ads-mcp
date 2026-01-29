import os
import sys
import uvicorn

# Pfad-Korrektur, damit ads_mcp gefunden wird
sys.path.append(os.getcwd())

print("--- STARTING VIA UVICORN ---")

try:
    # Wir laden das mcp-Objekt aus deiner server.py
    from ads_mcp.server import mcp
    
    # Port von Google Cloud abgreifen
    port = int(os.environ.get("PORT", 8080))
    
    print(f"Uvicorn startet auf 0.0.0.0:{port}...")
    
    # Wir starten die Starlette-App des MCP-Servers direkt.
    # Das umgeht alle Fehler mit der mcp.run() Funktion.
    uvicorn.run(mcp.app, host="0.0.0.0", port=port)

except Exception as e:
    print(f"FEHLER BEIM START: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
