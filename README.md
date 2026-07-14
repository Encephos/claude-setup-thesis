# 🎓 Claude Setup: Thesis

Dieses Repository enthält eine kuratierte Sammlung maßgeschneiderter Skills für [Claude Code](https://github.com/anthropics/claude-code) (das CLI-Tool von Anthropic). Das Setup ist speziell darauf ausgelegt, den Prozess des wissenschaftlichen Arbeitens (Bachelorarbeit, Masterarbeit, Dissertation) effizienter, präziser und methodisch sauberer zu gestalten.

Die Skills erweitern Claude um spezifische Fähigkeiten für das akademische Lektorat, die Literaturrecherche, die formale Zitationsprüfung, explorative Datenanalyse sowie strukturelle und inhaltliche Qualitätskontrollen.

---

## 🛠️ Enthaltene Skills

### 1. `science-de` (Akademisches Lektorat & Übersetzung)
Transformiert Rohtexte in ein hochgradig akademisches, natürliches Deutsch. 
* **Fokus:** Korrektur von direkten / wörtlichen Übersetzungen aus dem Englischen, Vermeidung von "falschen Freunden" (False Friends) und "Denglisch". 
* **Stil:** Wendet strikt den deutschen Wissenschaftsstil an (Nominalstil, Passiv/unpersönliche Konstruktionen, Objektivität).

### 2. `quellen-check` (Zitations- & Belegprüfung)
Agiert als penibler akademischer Gutachter für Literaturangaben und Zitate.
* **Fokus:** Prüft die formale Vollständigkeit (Standardzitierweisen, Abrufdaten für URLs, Versionsnummern bei ArXiv-Preprints).
* **Validierung:** Gleicht aufgestellte Behauptungen im Text mit den zitierten Quellen ab, um Überinterpretationen (Overclaiming) zu verhindern.

### 3. `quellen-finder` (Native Literaturrecherche)
Nutzt Claudes integrierte Websuche, um verlässliche wissenschaftliche Literatur zu recherchieren.
* **Fokus:** Verwendet gezielte akademische Suchoperatoren (z. B. `site:arxiv.org`, `site:semanticscholar.org`), um SEO-Spam zu filtern.
* **Anti-Halluzination:** Jede ausgegebene Quelle muss durch echte DOIs oder Links verifiziert sein.

### 4. `datenauswerter` (Explorative Datenanalyse)
Ein automatisierter Data-Science-Agent, der einen kompletten Ordner analysiert.
* **Fokus:** Extrahiert Daten aus CSVs, Tabellen oder Texten (oftmals durch temporäre Python-Skripten wie `pandas`).
* **Analyse:** Identifiziert systemübergreifende Korrelationen, Muster und Zusammenhänge. Stellt datengetriebene Hypothesen für mögliche Kausalitäten auf.

### 5. `devils-advocate` (Kritischer Peer-Reviewer)
Unterzieht deine Argumentation und Methodik einem gnadenlosen Stresstest.
* **Fokus:** Deckt logische Fehlschlüsse, unbegründete Annahmen und methodische Schwächen (z. B. Biases) auf.
* **Nutzen:** Liefert präventive Gegenargumente, damit du deine Arbeit unangreifbar machen kannst, bevor der Betreuer sie liest.

### 6. `abstract-gen` (Der Kondensator)
Kondensiert Forschungsergebnisse, einzelne Kapitel oder ganze Arbeiten in präzise Abstracts.
* **Fokus:** Sorgt für die exakte Einhaltung von Wortlimits (z. B. max. 250 Wörter) und die korrekte Gewichtung von Hintergrund, Methodik, Ergebnissen und Fazit.
* **Zusatz:** Generiert automatisch passende akademische Keywords.

### 7. `structure-logic-check` (Der Rote Faden)
Prüft die Makro- und Mikrostruktur deiner Arbeit auf Logik und Kohärenz.
* **Fokus (Makro):** Analysiert Inhaltsverzeichnisse auf logischen Aufbau und sinnvolle Gewichtung.
* **Fokus (Mikro):** Untersucht Kapitel auf fließende Übergänge (Transitions), identifiziert inhaltliche Abschweifungen zum Kürzen und deckt Argumentationsbrüche auf.

---

## 🚀 Installation

Du kannst diese Skills entweder global (für deinen gesamten Rechner) oder lokal (nur für das Verzeichnis deiner Abschlussarbeit) installieren.

### Option A: Globale Installation (Empfohlen)
Kopiere die Ordner der Skills in das globale Claude Code Skill-Verzeichnis:
```bash
# Erstelle den Ordner, falls er nicht existiert
mkdir -p ~/.claude/skills

# Kopiere die Skills aus diesem Repo in das globale Verzeichnis
cp -r skills/* ~/.claude/skills/
```

### Option B: Lokale Installation (Pro Projekt)
Wenn du die Skills nur in einem bestimmten Projektverzeichnis nutzen möchtest, erstelle dort einen .claude/skills/ Ordner und lege die Dateien ab:
```bash
cd /pfad/zu/deiner/thesis
mkdir -p .claude/skills
cp -r /pfad/zu/claude-setup-thesis/skills/* .claude/skills/
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
