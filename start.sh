#!/usr/bin/env bash
# Start-Skript für das Kassensystem TSV Billigheim

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "=========================================="
echo "  TSV Billigheim - Kassensystem startet   "
echo "=========================================="
echo ""
echo "Öffne index.html im Standard-Browser..."

if command -v xdg-open > /dev/null; then
  xdg-open "$DIR/index.html"
elif command -v firefox > /dev/null; then
  firefox "$DIR/index.html" &
else
  echo "Kein Browser-Befehl gefunden. Bitte öffnen Sie '$DIR/index.html' manuell."
fi
