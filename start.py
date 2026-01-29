import os
import sys

# Pfad fixen
sys.path.append(os.getcwd())

print("--- MCP DIAGNOSE ---")
print(f"Dateien im Ordner: {os.listdir('.')}")
if os.path.exists('ads_mcp'):
    print(f"Dateien in ads_mcp: {os.listdir('ads_mcp')}")

try:
    print("Versuche Import von ads_mcp.server...")
    import ads_mcp.server as server_module
    
    # Wir suchen automatisch, wie die MCP-Instanz heißt (mcp oder server)
    mcp_instance = getattr(server_module, "mcp", None) or getattr(server_module, "server", None)
    
    if mcp_instance is None:
        print("FEHLER: Weder 'mcp' noch 'server' wurde in ads_mcp/server.py gefunden!")
        sys.exit(1)
        
    print("Sieg: MCP-Instanz gefunden. Starte SSE-Server...")
    # Wir lassen die Bibliothek alles regeln (Port 8080 wird automatisch erkannt)
    mcp_instance.run(transport="sse")

except Exception as e:
    print(f"!!! ABSTURZ: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
