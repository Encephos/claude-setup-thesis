# Projektkontext fuer Claude Code

Dieses Verzeichnis nutzt das `claude-setup-thesis`-Toolkit: Skills (`.claude/skills/`)
und Agenten (`.claude/agents/`) fuer das Schreiben wissenschaftlicher Arbeiten
(Bachelor-, Master-, Doktorarbeit). Diese Datei gibt projektweite Leitplanken,
die ueber einzelne Skills hinausgehen. Sie gilt automatisch, sobald Claude Code
in diesem Verzeichnis (oder einer Kopie davon als eigenes Thesis-Projekt)
gestartet wird.

## Voraussetzungen (einmalig pro Rechner)
Vor der ersten inhaltlichen Aufgabe in diesem Projekt prüfen, ob `pdflatex`,
`mmdc` und `python3 -c "import pandas"` verfügbar sind (kurzer `command -v`-
Check genügt). Fehlt eines davon, zuerst `./scripts/setup-native.sh`
ausführen (installiert die fehlenden Werkzeuge auf macOS über Homebrew,
überspringt bereits vorhandene) und erst danach mit der eigentlichen Aufgabe
fortfahren. Git, gh und Claude Code selbst werden als bereits vorhanden
vorausgesetzt.

## Grundhaltung
- Nutze die vorhandenen Skills/Agenten proaktiv, auch ohne expliziten
  Slash-Befehl, wenn eine Aufgabe dazu passt (z. B. Formatierungsfrage ->
  `latex-thesis`, Stilfrage -> `science-de`/`style-guard`, Betreuer-Kritik ->
  `revision-implementer`).
- Behaupte nichts ueber den Zustand der Arbeit, das nicht selbst geprueft wurde
  (kompiliert, gerendert, gegrept). Siehe Skill `latex-thesis` fuer die
  Kompilier- und Sichtpruef-Kette.

## Minimalinvasive Ueberarbeitung
Bei einer nummerierten Kritik-/Korrekturliste (z. B. vom Betreuer) werden
GENAU diese Punkte umgesetzt - siehe Skill `revision-implementer`. Eine
Korrekturliste ist kein Anlass, zusaetzlich zu restrukturieren, umliegenden
Text umzuschreiben oder ungefragt Inhalte zu ergaenzen.

## Belege & Daten
Jedes Beispiel, jede Zahl und jedes Zitat muss auf eine echte, nachvollziehbare
Quelle zurueckfuehrbar sein (siehe `data-grounding`, `citation-checker`).
Keine erfundenen Beispieldaten, Messwerte oder Quellenangaben.

## Vertraulichkeit
Falls diese Arbeit einem Sperrvermerk oder einer Vertraulichkeitsvereinbarung
unterliegt: Inhalte NIEMALS in ein oeffentliches Repository pushen. Vor jedem
`git push`/`git remote add` pruefen, ob das Ziel privat ist, und im Zweifel
nachfragen statt anzunehmen.

## Werkzeuge
`scripts/setup-native.sh` installiert fehlende Werkzeuge auf macOS über
Homebrew (siehe Abschnitt "Voraussetzungen" oben).
