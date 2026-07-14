# Claude Setup: Thesis

Dieses Repository enthält eine kuratierte Sammlung maßgeschneiderter Skills für [Claude Code](https://github.com/anthropics/claude-code) (das CLI-Tool von Anthropic). Das Setup ist speziell darauf ausgelegt, den Prozess des wissenschaftlichen Arbeitens (Bachelorarbeit, Masterarbeit, Dissertation) effizienter, präziser und methodisch sauberer zu gestalten.

Die Skills erweitern Claude um spezifische Fähigkeiten für das akademische Lektorat, die Literaturrecherche, die formale Zitationsprüfung, explorative Datenanalyse, die technische Produktion (LaTeX, Abbildungen) sowie strukturelle und inhaltliche Qualitätskontrollen. Die mitgelieferte `CLAUDE.md` gibt zusätzlich projektweite Leitplanken (u. a. minimalinvasive Überarbeitung, Belegpflicht für Beispiele), die automatisch gelten, sobald Claude Code in diesem Verzeichnis läuft.

---

## Enthaltene Skills

### `science-de` – Akademisches Lektorat & Übersetzung
Überarbeitet Rohtexte, die oft aus dem Englischen übersetzt wurden oder in gebrochenem akademischem Deutsch entstanden sind. Der Skill sucht gezielt nach wörtlichen Übersetzungen, falschen Freunden (z. B. *evidence* ≠ *Evidenz*) und Anglizismen und ersetzt sie durch etablierte deutsche Fachbegriffe; zusätzlich überführt er den Text in Nominalstil und unpersönliche Konstruktionen, wie es der deutsche Wissenschaftsstil verlangt. Am Ende steht neben dem überarbeiteten Text eine Liste der vorgenommenen Korrekturen mit Begründung, damit nachvollziehbar bleibt, was warum geändert wurde.

### `citation-checker` – Zitations- & Belegprüfung
Prüft einzelne Quellenangaben oder ganze Literaturverzeichnisse auf formale Vollständigkeit (Autor, Jahr, Titel, Publikationsort) und auf Details, die häufig übersehen werden: Abrufdatum bei Internetquellen, Versionsnummer bei ArXiv-Preprints. Darüber hinaus gleicht er ab, ob eine im Text aufgestellte Behauptung tatsächlich durch die zitierte Quelle gedeckt ist, und weist auf Overclaiming hin – etwa wenn ein Paper vorsichtig formuliert, der zitierende Text daraus aber eine stärkere Aussage macht.

### `citation-finder` – Native Literaturrecherche
Recherchiert über die integrierte Websuche gezielt nach akademischen Quellen, statt allgemein zu suchen – etwa über `site:arxiv.org` oder `site:semanticscholar.org`, um Nicht-Fachliteratur auszufiltern. Jede vorgeschlagene Quelle muss einen echten, im Suchergebnis gefundenen Link oder eine DOI besitzen; reines Wissen aus dem Trainingskorpus ohne Beleg wird nicht als Quelle ausgegeben, um Halluzinationen zu vermeiden.

### `data-analyzer` – Explorative Datenanalyse
Sichtet einen kompletten Datenordner (CSV, Excel, JSON, Logs, Bilder) und verschafft sich zunächst einen Überblick über die enthaltenen Dateitypen. Für strukturierte Daten schreibt und führt er eigenständig kleine Python-Skripte aus (meist mit pandas), statt große Datenmengen direkt in den Kontext zu laden, und berechnet daraus Kennzahlen und Korrelationen. Kausale Aussagen werden dabei ausdrücklich als Hypothese gekennzeichnet, nicht als Fakt – die Unterscheidung zwischen Korrelation und Kausalität ist eine feste Regel dieses Skills.

### `devils-advocate` – Kritischer Peer-Reviewer
Liest einen Text nicht mit dem Ziel, ihn zu bestätigen, sondern um Schwachstellen zu finden: Zirkelschlüsse, unzulässige Verallgemeinerungen, fehlende Kontrollgruppen, unbelegte Prämissen. Das Ergebnis sind die stärksten Gegenargumente, die ein Gutachter vorbringen könnte, damit sie sich vor der Abgabe entkräften lassen, statt erst in der Verteidigung überraschend aufzutauchen.

### `abstract-condenser`
Verdichtet einen längeren Text (Einleitung, Methodik, Ergebnisse, Fazit) zu einem Abstract, der die vier klassischen Phasen abbildet, ohne dass diese als Überschriften ausgeschrieben werden müssen. Ein vorgegebenes Wortlimit wird exakt eingehalten statt nur ungefähr angenähert; am Ende liefert der Skill zusätzlich die tatsächliche Wortanzahl sowie mögliche Schlagwörter für Literaturdatenbanken.

### `structure-logic-checker` – Der rote Faden
Prüft zwei Ebenen getrennt: auf Makroebene, ob ein Inhaltsverzeichnis sinnvoll gewichtet ist und die Kapitel logisch aufeinander aufbauen; auf Mikroebene, ob innerhalb eines Kapitels die Übergänge zwischen Absätzen tragen oder ob Abschnitte enthalten sind, die vom eigentlichen Argument ablenken und gestrichen werden sollten. Das Ergebnis benennt konkrete Textstellen, nicht nur eine allgemeine Einschätzung.

### `latex-thesis` – Satz, Kompilierung & visuelle Prüfung
Übernimmt die technische Seite des Schreibens. Nach jeder Änderung wird die vollständige Kompilierkette (`pdflatex` → `biber` → `pdflatex` × 2) ausgeführt und das Log maschinell auf Fehler, offene Verweise und zu breite Zeilen geprüft; zusätzlich werden veränderte Seiten als Bild gerendert und tatsächlich angesehen, weil sich Layoutfehler wie abgeschnittene Tabellen oder verwaiste Leerflächen im Log allein nicht erkennen lassen. Der Skill bringt außerdem eine Sammlung erprobter Fixes für wiederkehrende KOMA-Script- und biblatex-Probleme mit (fehlende Seitenzahlen auf Kapitelseiten, große Lücken vor neuen Kapiteln, Literaturverzeichnis in Zitierreihenfolge statt alphabetisch).

### `figures-diagrams` – Wissenschaftliche Abbildungen
Erstellt Abbildungen als Vektorgrafik statt als Handskizze – bevorzugt über Mermaid, gerendert mit der mermaid-CLI direkt zu einem passgenau zugeschnittenen PDF, alternativ über TikZ für einfache Schemata. Die Diagrammquelle wird im Projekt abgelegt, damit die Abbildung reproduzierbar bleibt, und nach der Erstellung wird geprüft, ob Knotenzahl, Beschriftungen und Werte tatsächlich zur Beschreibung im Fließtext passen.

### `style-guard` – Stil- & Konsistenz-Linter
Sucht mit gezielten Textsuchen nach wiederkehrenden Stilfehlern des deutschen Wissenschaftsstils – rhetorische Fragen, Gedankenstriche, Semikolons, Ankündigungssätze wie „Dieses Kapitel behandelt", uneinheitlich verwendete Fachbegriffe – und meldet jede Fundstelle mit Datei und Zeile. Anders als `science-de` schreibt dieser Skill den Text nicht selbst um, sondern liefert nur die Diagnose, damit gezielt und punktuell korrigiert werden kann.

### `revision-implementer` – Minimalinvasive Überarbeitung
Setzt eine nummerierte Kritikliste – etwa vom Betreuer – Punkt für Punkt um, und zwar mit dem kleinstmöglichen Eingriff. Ein Kritikpunkt zu einem einzelnen Wort führt nicht dazu, dass der umgebende Absatz neu geschrieben wird; unklare Formulierungen werden eher nachgefragt als eigenmächtig großzügig ausgelegt. Am Ende steht eine Vergleichstabelle, die jeden Kritikpunkt seiner konkreten Änderung gegenüberstellt.

### `data-grounding` – Belege aus echten Daten
Ersetzt erfundene Beispielwerte durch echte, aus vorhandenen Rohdaten (Logs, Messreihen, CSVs) extrahierte Zahlen. Jeder im Text verwendete Wert lässt sich auf eine konkrete Quelle zurückführen (Lauf-ID, Zeile, Feld); wird aus Rohwerten ein abgeleiteter Wert gebildet, zeigt der Skill die Rechnung offen, statt nur das Ergebnis zu behaupten.

### `defense-prep` – Kolloquium & Verteidigung
Simuliert die mündliche Prüfung, indem er wahrscheinliche Prüferfragen je Kapitel ableitet und die Stellen benennt, an denen erfahrungsgemäß nachgebohrt wird – fehlende Evaluation, Verwechslung von Korrelation und Kausalität, Abgrenzung zu verwandten Arbeiten. Zu den härtesten Fragen liefert er knappe, ehrliche Musterantworten, die Grenzen der Arbeit offen benennen, statt sie zu überspielen.

---

## Enthaltene Agenten

Ein Skill lädt eine Fähigkeit für die aktuelle Sitzung nach; ein Agent (`.claude/agents/`) ist dagegen ein eigenständiger Bearbeiter, der in einem eigenen Kontext mehrschrittig und autonom arbeitet und am Ende ein fertiges Ergebnis zurückgibt, statt nach jedem Schritt auf eine neue Anweisung zu warten. Sinnvoll immer dann, wenn eine Aufgabe aus mehreren Iterationen besteht (kompilieren – prüfen – reparieren – erneut prüfen) oder eine ganze Arbeit in einem Durchgang über mehrere Dimensionen begutachtet werden soll.

### `thesis-reviewer` – Gutachter, read-only
Liest die Arbeit (oder Teile davon) selbst vollständig ein und begutachtet sie in einem Durchgang über mehrere Dimensionen gleichzeitig – Struktur, Stil, Zitierpraxis, Logik – statt dass jede Dimension einzeln über einen eigenen Skill-Aufruf geprüft werden muss. Er ändert selbst nichts an den Dateien, sondern liefert einen nach Schweregrad geordneten Bericht mit konkreten Fundstellen.

### `latex-fixer` – Build- & Layout-Agent
Arbeitet die Kompilier-Diagnose-Reparatur-Schleife von `latex-thesis` eigenständig ab, bis das Dokument fehlerfrei gesetzt ist. Änderungen bleiben dabei auf Formatierung und Layout beschränkt; inhaltliche Entscheidungen trifft der Agent nicht, sondern meldet sie zurück.

---

## Empfohlener Arbeitsablauf

Die Skills und Agenten decken den gesamten Lebenszyklus einer Arbeit ab:

1. **Recherche:** `citation-finder` → Quellen finden.
2. **Schreiben:** Rohtext verfassen, mit `science-de` ins akademische Deutsch überführen, Abbildungen mit `figures-diagrams` erzeugen, Zahlen mit `data-grounding` belegen.
3. **Setzen:** mit `latex-thesis` kompilieren und das Layout absichern.
4. **Prüfen:** `style-guard` (Stil), `citation-checker` (Belege), `structure-logic-checker` (roter Faden), `devils-advocate` (Kritik) – oder in einem Durchgang der Agent `thesis-reviewer`.
5. **Überarbeiten:** Betreuer-Kritik mit `revision-implementer` minimalinvasiv umsetzen; Layoutfehler mit `latex-fixer`.
6. **Abschluss:** `abstract-condenser` für den Abstract, `defense-prep` für die Verteidigung.

---

## Installation

Skills und Agenten lassen sich global (für alle Projekte) oder lokal (nur für ein bestimmtes Projektverzeichnis) installieren.

### Global
```bash
mkdir -p ~/.claude/skills ~/.claude/agents
cp -r .claude/skills/* ~/.claude/skills/
cp -r .claude/agents/* ~/.claude/agents/
```

### Lokal (pro Projekt)
```bash
cd /pfad/zu/deiner/thesis
mkdir -p .claude/skills .claude/agents
cp -r /pfad/zu/claude-setup-thesis/.claude/skills/* .claude/skills/
cp -r /pfad/zu/claude-setup-thesis/.claude/agents/* .claude/agents/
```

Fehlen LaTeX, Node.js/mermaid-CLI oder Python/pandas noch auf dem Rechner, installiert `scripts/setup-native.sh` sie unter macOS über Homebrew nach; bereits vorhandene Werkzeuge werden übersprungen.

## Nutzung
Skills lassen sich auf zwei Arten aufrufen.

**Explizit, per Slash-Befehl:**
```
/devils-advocate Lies dir meine Methodik in kapitel_3.md durch und zerreiß sie in der Luft. Wo sind meine Schwachstellen?

/abstract-condenser Erstelle aus den Dateien einleitung.md und fazit.md einen Abstract mit exakt 200 Wörtern.
```

**Implizit:** Claude Code erkennt anhand der Beschreibungen in den `SKILL.md`-Dateien automatisch, wann ein Skill relevant ist. Die Bitte, „den roten Faden in meinem Inhaltsverzeichnis zu prüfen", lädt im Hintergrund automatisch `structure-logic-checker`.

## Wissenschaftlicher Disclaimer
**Kausalität vs. Korrelation:** `data-analyzer` identifiziert zuverlässig Korrelationen. Kausalitäten lassen sich rein aus Daten jedoch nicht final beweisen – das bleibt Aufgabe der eigenen wissenschaftlichen Interpretation.

**Verifikation:** KI-Modelle können halluzinieren. Alle ausgegebenen Quellen, Behauptungen und korrigierten Fachbegriffe sollten vor der Übernahme in die finale Arbeit geprüft werden. Die Verantwortung für den Inhalt liegt bei der Autorin bzw. dem Autor.
