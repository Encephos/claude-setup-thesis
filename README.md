# 🎓 Claude Setup: Thesis

Dieses Repository enthält eine kuratierte Sammlung maßgeschneiderter Skills für [Claude Code](https://github.com/anthropics/claude-code) (das CLI-Tool von Anthropic). Das Setup ist speziell darauf ausgelegt, den Prozess des wissenschaftlichen Arbeitens (Bachelorarbeit, Masterarbeit, Dissertation) effizienter, präziser und methodisch sauberer zu gestalten.

Die Skills erweitern Claude um spezifische Fähigkeiten für das akademische Lektorat, die Literaturrecherche, die formale Zitationsprüfung, explorative Datenanalyse sowie strukturelle und inhaltliche Qualitätskontrollen. Die mitgelieferte `CLAUDE.md` gibt zusätzlich projektweite Leitplanken (z. B. minimalinvasive Überarbeitung, Belegpflicht für Beispiele), die automatisch gelten, sobald Claude Code in diesem Verzeichnis läuft.

---

## 🛠️ Enthaltene Skills

### 1. `science-de` (Akademisches Lektorat & Übersetzung)
Transformiert Rohtexte in ein hochgradig akademisches, natürliches Deutsch. 
* **Fokus:** Korrektur von direkten / wörtlichen Übersetzungen aus dem Englischen, Vermeidung von "falschen Freunden" (False Friends) und "Denglisch". 
* **Stil:** Wendet strikt den deutschen Wissenschaftsstil an (Nominalstil, Passiv/unpersönliche Konstruktionen, Objektivität).

### 2. `citation-checker` (Zitations- & Belegprüfung)
Agiert als penibler akademischer Gutachter für Literaturangaben und Zitate.
* **Fokus:** Prüft die formale Vollständigkeit (Standardzitierweisen, Abrufdaten für URLs, Versionsnummern bei ArXiv-Preprints).
* **Validierung:** Gleicht aufgestellte Behauptungen im Text mit den zitierten Quellen ab, um Überinterpretationen (Overclaiming) zu verhindern.

### 3. `citation-finder` (Native Literaturrecherche)
Nutzt Claudes integrierte Websuche, um verlässliche wissenschaftliche Literatur zu recherchieren.
* **Fokus:** Verwendet gezielte akademische Suchoperatoren (z. B. `site:arxiv.org`, `site:semanticscholar.org`), um SEO-Spam zu filtern.
* **Anti-Halluzination:** Jede ausgegebene Quelle muss durch echte DOIs oder Links verifiziert sein.

### 4. `data-analyzer` (Explorative Datenanalyse)
Ein automatisierter Data-Science-Agent, der einen kompletten Ordner analysiert.
* **Fokus:** Extrahiert Daten aus CSVs, Tabellen oder Texten (oftmals durch temporäre Python-Skripte wie `pandas`).
* **Analyse:** Identifiziert systemübergreifende Korrelationen, Muster und Zusammenhänge. Stellt datengetriebene Hypothesen für mögliche Kausalitäten auf.

### 5. `devils-advocate` (Kritischer Peer-Reviewer)
Unterzieht deine Argumentation und Methodik einem gnadenlosen Stresstest.
* **Fokus:** Deckt logische Fehlschlüsse, unbegründete Annahmen und methodische Schwächen (z. B. Biases) auf.
* **Nutzen:** Liefert präventive Gegenargumente, damit du deine Arbeit unangreifbar machen kannst, bevor der Betreuer sie liest.

### 6. `abstract-condenser` (Der Kondensator)
Kondensiert Forschungsergebnisse, einzelne Kapitel oder ganze Arbeiten in präzise Abstracts.
* **Fokus:** Sorgt für die exakte Einhaltung von Wortlimits (z. B. max. 250 Wörter) und die korrekte Gewichtung von Hintergrund, Methodik, Ergebnissen und Fazit.
* **Zusatz:** Generiert automatisch passende akademische Keywords.

### 7. `structure-logic-checker` (Der Rote Faden)
Prüft die Makro- und Mikrostruktur deiner Arbeit auf Logik und Kohärenz.
* **Fokus (Makro):** Analysiert Inhaltsverzeichnisse auf logischen Aufbau und sinnvolle Gewichtung.
* **Fokus (Mikro):** Untersucht Kapitel auf fließende Übergänge (Transitions), identifiziert inhaltliche Abschweifungen zum Kürzen und deckt Argumentationsbrüche auf.

### 8. `latex-thesis` (Satz, Kompilierung & visuelle Prüfung)
Der technische Kern für die Produktion. Erstellt und kompiliert die Arbeit und weist selbst nach, dass das PDF fehlerfrei ist.
* **Fokus:** Vollständige Kompilierkette (`pdflatex` → `biber` → `pdflatex` × 2), Diagnose von Fehlern, Overfull-Boxen und offenen Verweisen aus dem `.log`.
* **Visuelle Prüfung:** Rendert Seiten zu Bildern und prüft Abbildungen, Tabellen, Float-Platzierung, Leerflächen und Seitenzahlen – nichts wird nur behauptet.
* **Erprobte Fixes:** Seitenzahlen auf Kapitelseiten, fortlaufender Kapitel-Fließtext, Float-Leerraum, Tabellen-Überlauf, Silbentrennung, Literatur-Sortierung (`sorting=none`), einheitliches „et al.", Unterdrückung von „Ebd.".

### 9. `figures-diagrams` (Wissenschaftliche Abbildungen)
Ersetzt Handskizzen durch reproduzierbare Vektorgrafiken.
* **Fokus:** Rendert Mermaid-Diagramme mit der mermaid-CLI passgenau zu PDF (`mmdc -f`) und bindet sie ein; TikZ für einfache Kasten-Pfeil-Schemata.
* **Konsistenz:** Prüft, ob die Abbildung (Knotenzahl, Beschriftungen, Schwellenwerte) tatsächlich zum Fließtext passt.

### 10. `style-guard` (Stil- & Konsistenz-Linter)
Findet und meldet Stilverstöße – ohne den Text umzuschreiben.
* **Fokus:** rhetorische Fragen, Gedankenstriche, Semikolons/Halbsatz-Doppelpunkte, Füll-/Ankündigungssätze, Anglizismen, gemischte Zitierkürzel, uneinheitliche Terminologie.
* **Ausgabe:** jede Fundstelle als `Datei:Zeile` mit minimalem Korrekturvorschlag. Ergänzt `science-de` (das umschreibt) um eine reine Prüf-Sicht.

### 11. `revision-implementer` (Minimalinvasive Überarbeitung)
Setzt eine nummerierte Kritikliste des Betreuers Punkt für Punkt um.
* **Fokus:** kleinstmöglicher Eingriff pro Punkt, kein ungefragtes Umstrukturieren oder Hinzuerfinden von Inhalten.
* **Nutzen:** Verifiziert jede Änderung einzeln und liefert eine Vergleichstabelle „Vorher/Nachher" gegen die Ausgangsfassung.

### 12. `data-grounding` (Belege aus echten Daten)
Verankert Zahlen und Beispiele im Text in echten Projektdaten statt in erfundenen Werten.
* **Fokus:** extrahiert konkrete Werte aus Logs, Messreihen oder CSVs und formt daraus nachvollziehbare In-Text-Beispiele und Tabellen.
* **Nutzen:** jede Zahl ist auf eine Quelle (Lauf-ID, Zeile, Feld) zurückführbar; abgeleitete Werte werden offen nachgerechnet.

### 13. `defense-prep` (Kolloquium & Verteidigung)
Bereitet auf die mündliche Prüfung vor.
* **Fokus:** wahrscheinliche Prüferfragen pro Kapitel, angreifbare Stellen, souveräne Musterantworten, prägnanter Beitrags-Pitch.

---

## 🤖 Enthaltene Agenten

Neben den Skills (die eine Fähigkeit für die aktuelle Sitzung nachladen) enthält das Setup zwei **Agenten** in `.claude/agents/`. Agenten arbeiten mehrschrittig und autonom in einem eigenen Kontext und geben am Ende ein fertiges Ergebnis zurück.

### `thesis-reviewer` (Gutachter, read-only)
Begutachtet eine Datei, ein Kapitel oder das ganze Projekt in einem Durchgang über mehrere Dimensionen (Struktur, Stil, Zitierpraxis, Logik/Methodik) und liefert einen nach Schweregrad geordneten, belegten Befundbericht. Ändert keine Dateien.

### `latex-fixer` (Build- & Layout-Agent)
Kompiliert die Arbeit autonom über die volle Kette, diagnostiziert Fehler und Layoutprobleme, prüft die betroffenen Seiten visuell und behebt sie minimal, bis das PDF sauber ist.

---

## 🔄 Empfohlener Arbeitsablauf

Die Skills und Agenten decken den gesamten Lebenszyklus einer Arbeit ab:

1. **Recherche:** `citation-finder` → Quellen finden.
2. **Schreiben:** Rohtext verfassen, mit `science-de` ins akademische Deutsch überführen, Abbildungen mit `figures-diagrams` erzeugen, Zahlen mit `data-grounding` belegen.
3. **Setzen:** mit `latex-thesis` kompilieren und das Layout absichern.
4. **Prüfen:** `style-guard` (Stil), `citation-checker` (Belege), `structure-logic-checker` (roter Faden), `devils-advocate` (Kritik) – oder in einem Rutsch der Agent `thesis-reviewer`.
5. **Überarbeiten:** die Betreuer-Kritik mit `revision-implementer` minimalinvasiv umsetzen; Layoutfehler mit `latex-fixer`.
6. **Abschluss:** `abstract-condenser` für den Abstract, `defense-prep` für die Verteidigung.

---

## ⚡ Ordner teilen, ohne dass andere manuell etwas installieren müssen

Der ganze Ordner (inkl. `.claude/`, `CLAUDE.md`, `scripts/`) lässt sich direkt weitergeben – z. B. an Kommilitonen, die selbst schon Claude Code nutzen (etwa über Claude Desktop). `CLAUDE.md` weist Claude an, beim ersten Start in diesem Ordner selbst zu prüfen, ob `pdflatex`, `mmdc` (mermaid-CLI) und Python/pandas vorhanden sind, und bei Bedarf automatisch `scripts/setup-native.sh` auszuführen (macOS, per Homebrew, überspringt bereits vorhandene Werkzeuge) – erst danach beginnt die eigentliche Arbeit mit den Skills/Agenten. Git, gh und Claude Code selbst werden als bereits vorhanden vorausgesetzt.

```bash
# Ordner kopieren/klonen, dann einfach:
claude
# → prüft Voraussetzungen, installiert bei Bedarf automatisch nach, legt los
```

Wer das Setup lieber selbst anstößt statt es Claude überlassen: `./scripts/setup-native.sh` manuell ausführen.

---

## 🚀 Installation (nur Skills/Agenten, eigenes Toolchain vorhanden)

Wer LaTeX, Node.js und Python bereits selbst installiert hat und nur die Skills/Agenten nachrüsten möchte, kann sie einzeln kopieren – ohne `scripts/setup-native.sh`.

Du kannst diese Skills entweder global (für deinen gesamten Rechner) oder lokal (nur für das Verzeichnis deiner Abschlussarbeit) installieren.

### Option A: Globale Installation (Empfohlen)
Kopiere Skills und Agenten in die globalen Claude-Code-Verzeichnisse:
```bash
# Erstelle die Ordner, falls sie nicht existieren
mkdir -p ~/.claude/skills ~/.claude/agents

# Kopiere Skills und Agenten aus diesem Repo in die globalen Verzeichnisse
cp -r .claude/skills/* ~/.claude/skills/
cp -r .claude/agents/* ~/.claude/agents/
```

### Option B: Lokale Installation (Pro Projekt)
Wenn du Skills und Agenten nur in einem bestimmten Projektverzeichnis nutzen möchtest, kopiere den `.claude/`-Ordner dorthin:
```bash
cd /pfad/zu/deiner/thesis
mkdir -p .claude/skills .claude/agents
cp -r /pfad/zu/claude-setup-thesis/.claude/skills/* .claude/skills/
cp -r /pfad/zu/claude-setup-thesis/.claude/agents/* .claude/agents/
```
## 💡 Nutzung
Starte Claude Code in deinem Terminal (claude). Du kannst die Skills nun auf zwei Arten verwenden:

### 1. Expliziter Aufruf (via Slash-Befehl):
Tippe den Namen des Skills mit einem Schrägstrich ein und hänge deine Aufgabe an.

/devils-advocate Lies dir meine Methodik in kapitel_3.md durch und zerreiß sie in der Luft. Wo sind meine Schwachstellen?

/abstract-gen Erstelle aus den Dateien einleitung.md und fazit.md einen Abstract mit exakt 200 Wörtern.

### 2. Impliziter Aufruf:
Claude Code erkennt anhand der Beschreibungen in den SKILL.md Dateien automatisch, wann ein Skill relevant ist. Wenn du ihn bittest, "den roten Faden in meinem Inhaltsverzeichnis zu prüfen", lädt er im Hintergrund automatisch den structure-logic-check Skill.

## ⚠️ Wissenschaftlicher Disclaimer
Kausalität vs. Korrelation: Der datenauswerter identifiziert hervorragend Korrelationen. Kausalitäten lassen sich rein aus den Daten jedoch nicht final beweisen – dies obliegt deiner wissenschaftlichen Interpretation.

Verifikation: KI-Modelle können halluzinieren. Überprüfe alle ausgegebenen Quellen, Behauptungen und korrigierten Fachbegriffe sorgfältig, bevor du sie in deine finale Arbeit übernimmst. Du als Autor trägst die finale Verantwortung für den Inhalt.
