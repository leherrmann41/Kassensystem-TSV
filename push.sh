#!/usr/bin/env bash
# Git Push Skript für Kassensystem-TSV

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "=================================================="
echo "  Kassensystem TSV -> Push zu GitHub               "
echo "  Repository: leherrmann41/Kassensystem-TSV        "
echo "=================================================="
echo ""

# 1. Branch auf 'main' setzen
git branch -M main

# 2. Dateien hinzufügen
echo "-> Dateien vormerken (git add)..."
git add .

# 3. Commit erstellen
echo "-> Commit erstellen..."
git commit -m "Kassensystem TSV: Vollbild-Layout, 7x4 Raster ohne Scrollen und neue Speisekarte" || echo "Keine neuen Änderungen zu committen."

# 4. Remote prüfen/setzen
git remote set-url origin https://github.com/leherrmann41/Kassensystem-TSV.git

# 5. Push
echo ""
echo "-> Pushe zu GitHub (Branch: main)..."
echo "Hinweis: Wenn GitHub nach Benutzername/Passwort fragt:"
echo "  - Benutzername: leherrmann41"
echo "  - Passwort:     Dein GitHub Personal Access Token (PAT)"
echo ""

if git push -u origin main; then
  echo ""
  echo "Fertig! Erfolgreich auf GitHub übertragen."
else
  echo ""
  echo "------------------------------------------------------------"
  echo "HINWEIS:"
  echo "Falls der Push abgelehnt wurde (z.B. weil auf GitHub bereits"
  echo "eine README oder Initialdateien existieren), kannst du den"
  echo "Push erzwingen mit:"
  echo ""
  echo "  git push -u origin main --force"
  echo "------------------------------------------------------------"
fi
