import os
import sys

# Pfad-Korrektur
sys.path.append(os.getcwd())

print("--- MCP CLOUD BOOTSTRAP ---")

try:
    # Importiert die Instanz 'mcp' aus ads_mcp/server.py
    from ads_mcp.server import mcp
    print("Server-Instanz 'mcp' erfolgreich geladen.")

    print("Starte SSE-Server (Port wird automatisch von Bibliothek erkannt)...")
    
    # WICHTIG: Wir entfernen 'host' und 'port'. 
    # Die Bibliothek liest die Umgebungsvariable PORT (8080) automatisch aus.
    mcp.run(transport="sse")

except Exception as e:
    print(f"BOOT FEHLER: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
