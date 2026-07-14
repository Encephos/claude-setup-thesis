#!/usr/bin/env bash
# Installiert die von den Skills/Agenten benoetigten Werkzeuge auf macOS ueber
# Homebrew: LaTeX (mactex-no-gui), mermaid-CLI (Node) und Python/pandas.
# Ueberspringt bereits vorhandene Werkzeuge. Setzt Homebrew, git und Claude
# Code als bereits vorhanden voraus (z. B. ueber Claude Desktop installiert).
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "Dieses Skript ist fuer macOS. Fuer andere Systeme die Werkzeuge (LaTeX," >&2
    echo "mermaid-CLI, Python/pandas) bitte manuell installieren." >&2
    exit 1
fi

if ! command -v brew &>/dev/null; then
    echo "Homebrew fehlt. Installationsanleitung: https://brew.sh" >&2
    exit 1
fi

echo "==> Pruefe LaTeX..."
if ! command -v pdflatex &>/dev/null; then
    brew install --cask mactex-no-gui
    eval "$(/usr/libexec/path_helper)"
else
    echo "    pdflatex bereits vorhanden, uebersprungen."
fi

echo "==> Pruefe Node.js / mermaid-CLI..."
if ! command -v node &>/dev/null; then
    brew install node
else
    echo "    node bereits vorhanden, uebersprungen."
fi
if ! command -v mmdc &>/dev/null; then
    npm install -g @mermaid-js/mermaid-cli
else
    echo "    mermaid-cli bereits vorhanden, uebersprungen."
fi

echo "==> Pruefe Python / pandas..."
if ! command -v python3 &>/dev/null; then
    brew install python
fi
if ! python3 -c "import pandas" &>/dev/null; then
    pip3 install --user pandas numpy matplotlib
else
    echo "    pandas bereits vorhanden, uebersprungen."
fi

echo ""
echo "==> Fertig. Skills/Agenten stehen unter .claude/ bereit, direkt loslegen mit: claude"
