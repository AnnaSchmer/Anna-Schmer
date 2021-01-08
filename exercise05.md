**Name:** Anna Schmer

**E-Mail:** anna.schmer@smail.th-koeln.de

## Exercise 5

**1.** Die Datei könnte eine Art Drehbuch sein oder eine Schrift, die Zitate darstellen soll, 
die von bestimmten Charaktern in einem Filmteil gesprochen wurden. Diese enthält vier Spalten. Die erste Spalte hat keinen Titel, 
aber stellt eine Nummerierung der Zeilen dar, beginnend von der Zahl 0. Die zweite Spalte trägt den Titel 'char' 
und steht für character. Hier sind jene aufgelistet, die in dem Film "Der Herr der Ringe" vorkommen und einen Text sprechen. 
Einige Passagen enthalten sogar eine Handlungsanweisung. Zu nennen wäre noch, dass in dieser Spalte 'char' Voice-over vorkommen. 
Die dritte Spalte 'dialog' bildet die Phrasen und Handlungen ab, die von dem 'character' in einem der Filme gesprochen oder die
Handlung getätigt wurde/werden soll. Die vierte Spalte 'film' soll darstellen in welchem Film Teil, welches Zitat oder Dialog vorkommt.

**2.** Ich habe mit OpenRefine (GREL), Excel und TextMate gearbeitet.

In Spalte 1, Zeile 15 ist die Zahl 15 ausgeschrieben und nicht einheitlich zu den anderen Zahlen. 
OpenRefine hat es automatisch in die Zahl (15) umgewandelt. Die Zahl würde ich mit  value.toNumber() ändern.

Spalte 1  habe ich komplett gelöscht, da sie überflüssig ist und für den weiteren Arbeitsverlauf nicht benötigt wird. 

*Befehl: Edit column -> Remove this column*

Ich habe in Spalte 2 den Titel in 'character' umbenannt, da es die genaue Bezeichnung ist und somit keine Abkürzung darstellt.
Spalte 4 habe ich in 'trilogy_part' umbenannt, da es eine Filmreihe ist und die einzelnen Zusatztitel des Films aufgelistet sind.

*Befehl: Edit column -> Rename this column*

Ich habe aus 4 Spalten, 5 gemacht. Die Spalte mit der Nummerierung habe ich ja entfernt. 
Die Spalte 'sound-recording' und 'action' erstellt, und neu angeordnet: trilogy_film_part, character, sound_recording, dialog, action.
Die Anordnung erschien mir sinnvoller, da zuerst bekannt sein muss aus welchem Film, welcher Charakter, mit oder ohne Voice-over etwas 
spricht und dabei tut. Die Spalte 'action' steht am Ende und trotzdem in Klammern, damit noch erkennbar bleibt, an welcher Stelle im Dialog die 
Handlung durchgeführt wird, diese aber trotzdem in einer separaten Spalte landet. Sound_recording folgt nach dem Charakter, da das Voice-over über 
einer anderen Tonaufnahme gelegt wird, in dem Fall auf die Dialoge. 

Es sollte nur eine Information in einer Spalte stehen, daher war die Spalte sound-recording notwendig, da neben Charakteren eine Angabe 
über den Ton angegeben war. Die Spalte "action" war notwendig, da in einigen Dialogen, Handlungen in Klammern beschrieben wurden. 
Die Zeile 597 (To the keep!) und Zeile 13 (Murderer) stellen allerdings Ausnahmen dar, weshalb ich diese nicht in 'action' erfasst habe. 
(Andere Sonderzeichen wie: (, (.) und (,.) habe ich als 'dirty data' aufgefasst und gelöscht.)

In 'character' sind Angaben über den Ton aufgelistet. Ich habe in dem Fenster 'Facet' nach 'Voice' gesucht und nur die ausgewählten Zeilen
 mit Voice ausgewählt. Dann habe ich in die Spalte 2 ein Kommata vor jedem Voice-Over, Voiceover, Voice und Voice Over generiert, 
um das Voice Over in einer separaten Spalte zu generieren. Dann habe ich eine neue Spalte 'sound_recording' erstellt, 
in der ich alle Voice over/ Voice gelistet habe, daraufhin habe ich alle Komma, Voice over und Voice in zwei Befehlen von der Spalte character entfernt.

*Befehl: Face -> Text facet, Text filter, value.replace (/(\w.)(\s[vV]oice)/,'$1'+','+'$2'), Edit column -> Add column based on this column -> value.replace(/(\w+), 
([vV]oice)/,'$2'), value.replace(/(\w+)(, [vV]oice[\s\-]?\w+)$/,'$1', value.replace (/(\w+)(,[vV]oice)$/,'$1'), value.replace(/Voice/,'')*

Ich habe nach der Handlung in Klammern gesucht und diese in eine neue Spalte 'action' generiert.

*Befehl: value.replace(/(.*)(\([a-zA-Z\.\s]+\))(.*)/, '$2'), value.replace(/(.*)(\(He is crying.\))(.*)/, '$2'), edit column -> join columns*

In Spalte 3 und 4 habe ich die whitespaces entfernt, die am Anfang und Ende des Textes waren und ebenso aufeinanderfolgende Leerzeichen.

*Befehl: value.trim (), value.replace (/\s+/,' ')*

In 'dialog' haben sich mehrere Tabulatoren und Leerzeichen mit Kommata eingeschlichen. Ich habe überflüssige whitespaces innerhalb des Textes entfernt. 
Außerdem habe falsch platzierte Kommata entfernt.

*Befehl: value.replace(/\s,\s+/,''), value.replace(/,(\w)/,'$1')*

In Spalte 2, Zeile 13 habe ich die Klammer '(' entfernt und in Spalte "dialog", Zeile 13 hinzugefügt.

*Befehl: edit* 

Damit es deutlich wird, dass es sich um Zitate handelt und diese einheitlich zu den anderen Zeilen mit Anführungszeichen werden, habe ich diese bei allen hinzugefügt.
Nach der Konvertierung in CSV wurden fehlerhaft """ angezeigt und deshalb habe ich diese in Excel mit der Option 'Suchen + Ersetzen', zwei " entfernt.

*Befehl: value.replace (value, '"' + value + '"')*

Ich musste weitere Änderungen in Excel vornehmen. Diese habe ich mit der Option 'Ersetzen.. -> Suchen nach -> Ersetzen durch' geändert. 
Diese (Sonder-)Zeichen habe ich durch ein Leerzeichen ersetzt: ¬†, ¬†¬†, (,), (,.), (.

Mit TextMate habe ich in der Spalte character "/" durch "AND" ersetzt, ARGORN durch ARAGORN, GACADRIL durch GACADRIEL, GATEKEEPR durch GATEKEEPER, 
GAN DALF durch GANDALF, GRISHNAK und GRISHNAKHH duch GRISHNAKH und URUK HAI durch URUK-HAI. Es hat sich außerdem ein
GENERAL SHOUT in Zeile 1878 in die Spalte eingeschlichen. Das "shout" habe ich entfernt und in die Spalte 
"action" übertragen, da es eine andere Information ist.
Außerdem habe ich alle Voice-Over, Voiceover, Voice und Voice-over durch Voice Over ersetzt, um es einheitlich zu machen.

**3.**

**3.1**
Hier habe ich die Anzahl der Zeilen generiert:
* cat ./lotr_scripts.csv | wc -l

Es sind 2390 Zeilen.

Hier habe ich die unique Wörter in dialog generiert, indem ich die Spalte dialog angesprochen, sortiert und die Worte ausgeben lassen habe.
* cut -d $',' -f4 ./lotr_scripts.csv | sort | uniq | wc -w

Es sind 17185 unique Wörter.

**3.2**

Hier habe ich die erste Spalte anvisiert und explizit nach den Titeln gesucht und mir diese, als Zeilen ausgeben lassen.

*cut -d $',' -f1 ./lotr_scripts.csv | grep -E '(?:The Return of the King)' | wc -l*

The Return of the King = 873x kommt der Titel vor.

*cut -d $',' -f1 ./lotr_scripts.csv | grep -E '(?:The Two Towers)' | wc -l*

The Two Towers = 1010x kommt der Titel vor.

*cut -d $',' -f1 ./lotr_scripts.csv | grep -E '(?:The Fellowship of the Ring)' | wc -l*
 
The Fellowship of the Ring = 507x kommt der Titel vor.

**3.3**

Ich habe zuerst die Spalte character sortiert und doppelte Zeilen verworfen und die Ergebnise in die characterlist.txt erfasst.

*cut -d $',' -f2 ./lotr_scripts.csv | grep -E '([A-Z])'| sort | uniq > characterlist.txt*

Dann habe ich die Datei characterlist_not_unique.txt erzeugt, in der die Charakternamen mehrfach vorkommen.

*cut -d $',' -f2 ./lotr_scripts.csv | grep -E '([A-Z])'| sort > characterlist_not_unique.txt*

Dadurch konnte ich die zwei Listen vergleichen und anhand des folgenden Befehls die Vorkommen der einzelnen Charaktere ermitteln.
Die Option -f gibt lediglich an, dass es sich um Dateien handelt, die verglichen werden. Uniq -c zählt letztendlich die Häufigkeit der Vorkommen:

*grep -f characterlist.txt characterlist_not_unique.txt | sort | uniq -c*

Die Top-5 sind demnach:

1. 229 FRODO
2. 218 SAM
3. 215 GANDALF
4. 189 ARAGORN
5. 163 PIPPIN


**3.4** 

Hier habe ich die Dialoge in eine Textdatei verschoben und dann die Charaktere in Worten, summiert ausgeben lassen.

*cut -d $’,' -f4 ./lotr_scripts.csv > dialoge.txt*

*grep 'Charakter' dialoge.txt | wc -w* 

Bemerkung: Ich habe mich an den Zahlen aus dem count Ergebnis aus 3.3 orientiert und diese in ‚‘Charakter’ eingegeben.
Ich habe bewusst nicht mit grep -i gearbeitet, da beispielsweise „men“ oder „man“ in Worten vorkommen, die keinen Charakter darstellen.

Top-5 sind demnach:

1. 898 Frodo
2. 502 Hobbit

~~(2. 482 Men)~~**-> Damit ist nicht immer der Charakter, der gesprochen hat, gemeint, sondern einfach die Bezeichnung "Männer". 
Sprich: Für unterschriedliche Bezeichnungen, verschiedene Worte, ist fehlerhaft daher durchgestrichen.**

3. 448 Gandalf
4. 444 Saruman
5. 328 Sam
