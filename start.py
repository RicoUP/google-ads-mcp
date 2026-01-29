import os
import sys
import uvicorn

# Pfad-Korrektur
sys.path.append(os.getcwd())

print("--- CLOUD RUN MASTER START ---")

try:
    # Wir importieren die MCP-Instanz
    from ads_mcp.server import mcp
    print("MCP Instanz erfolgreich geladen.")

    # Port von Google Cloud abgreifen
    port = int(os.environ.get("PORT", 8080))
    
    print(f"Starte Uvicorn auf 0.0.0.0:{port}...")
    
    # FastMCP-Instanzen haben eine fertige Web-App unter '.app'
    # Wir starten diese direkt mit uvicorn
    uvicorn.run(mcp.app, host="0.0.0.0", port=port)

except Exception as e:
    print(f"FEHLER BEIM START: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
