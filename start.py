import os
import sys

# Pfad-Korrektur
sys.path.append(os.getcwd())

print("--- MCP CLOUD BOOTSTRAP ---")

try:
    # Importiert die Instanz 'mcp' aus ads_mcp/server.py
    from ads_mcp.server import mcp
    print("Server-Instanz 'mcp' erfolgreich geladen.")

    print("Starte SSE-Server...")
    
    # WICHTIG: Hier dürfen NUR transport="sse" stehen.
    # KEIN 'host', KEIN 'port' - sonst stürzt es in der Cloud ab!
    mcp.run(transport="sse")

except Exception as e:
    print(f"BOOT FEHLER: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
