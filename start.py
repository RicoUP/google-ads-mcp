import os
import sys

# Fix für die Pfadsuche
sys.path.append(os.getcwd())

print("--- MCP CLOUD BOOTSTRAP ---")

try:
    # Importiert die Instanz 'mcp' aus ads_mcp/server.py
    from ads_mcp.server import mcp
    print("Server-Instanz 'mcp' erfolgreich geladen.")

    port = int(os.environ.get("PORT", 8080))
    print(f"Starte SSE-Server auf Port {port}...")

    # Startet den Server im Web-Modus (SSE)
    mcp.run(transport="sse", host="0.0.0.0", port=port)

except Exception as e:
    print(f"BOOT FEHLER: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
