import os
import sys

# Pfad korrigieren
sys.path.append(os.getcwd())

print("--- MCP CLOUD RUN START-SEQUENZ ---")

try:
    # Wir importieren die MCP-Instanz
    from ads_mcp.server import mcp
    print("MCP Instanz erfolgreich geladen.")

    # Port von Google Cloud abgreifen
    port = int(os.environ.get("PORT", 8080))
    
    print(f"Starte SSE-Server auf Port {port}...")
    
    # WICHTIG: Die FastMCP.run() Methode in Python 
    # unterstützt transport="sse" und lauscht automatisch auf 0.0.0.0
    # wenn sie in einer Cloud-Umgebung (mit gesetztem PORT) läuft.
    mcp.run(transport="sse")

except Exception as e:
    print(f"FEHLER BEIM START: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
