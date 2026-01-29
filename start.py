import os
import sys
import time

# Pfad-Diagnose
current_dir = os.getcwd()
sys.path.append(current_dir)

print(f"--- DIAGNOSE START ---")
print(f"Verzeichnis: {current_dir}")
print(f"Dateien im Verzeichnis: {os.listdir(current_dir)}")
print(f"Python Pfad: {sys.path}")

try:
    print("Versuche ads_mcp.server zu importieren...")
    from ads_mcp.server import main
    print("Import erfolgreich!")
    
    # Cloud Run Port abgreifen
    port = int(os.environ.get("PORT", 8080))
    
    # Argumente für den SSE-Modus simulieren
    sys.argv = ["ads_mcp", "run", "--transport", "sse", "--host", "0.0.0.0", "--port", str(port)]
    
    print(f"Starte Google Ads MCP auf Port {port}...")
    main()

except Exception as e:
    print(f"!!! KRITISCHER FEHLER: {e}")
    import traceback
    traceback.print_exc()
    # Wir halten den Container offen, damit du die Logs in Ruhe lesen kannst
    time.sleep(30)
    sys.exit(1)
