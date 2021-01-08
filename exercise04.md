**Name:** Anna Schmer

**E-Mail:** anna.schmer@smail.th-koeln.de

# Excercise 4

#!/bin/bash

- Zeigt an, dass die Datei eine Bash-Datei ist.

grep -E -c '(china|chinese)' ./ *.tsv 

Ergebnis:
 
./2014-01-31_JA-africa.tsv:1

./2014-01-31_JA-america.tsv:5

./2014-01_JA.tsv:186

./2014-02-02_JA-britain.tsv:6

- Durch diesen regulären Ausdruck werden alle Dateien, die die Endung "tsv" im "working directory" haben, 
nach den Wörtern "china" oder "chinese" durchsucht und anschließend die gefundenen Zeilen pro tsv-Datei ausgegeben. 
Das -E ist notwenig für RE und -c zählt die Zeilen in denen der Begriff gefunden wurde. Somit wird wc -l überflüssig.

cut -d $'\t' -f9 ./ *.tsv | grep -E -c '(china|chinese)'

Ergebnis:
182

- In der 9. Spalte 'Title' soll nach "china" oder "chinese" gesucht werden und nur noch diese als eigene Zeilen ausgegeben werden.
Das wird ermöglicht durch die Option -d, welche den "Delimiter" (Trennzeichen) angibt. 
Dadurch weiß Bash nach welchem Zeichen ein neues Feld deklariert wird.
In diesem Fall ist der Delimiter ein Tabulator, welcher als $'\t' angegeben werden kann.
Die Option -f9 gibt dann nur noch an, dass das 9. Feld ausgegeben werden soll. 

cut -d $'\t' -f6 ./ *.tsv | grep -E -c '([0-9]{1,4}-[0-9]{1,4}X?)' 

Ergebnis:
564060

- Ab der 6. Spalte soll nach der 'ISSN' gesucht werden und dann in Zeilen ausgegeben werden. Eine ISSN besteht aus 8 Zeichen, 
das letzte Zeichen kann ein X sein oder eine Zahl, deshalb X?. Die ersten Zahlen sind definitiv Zahlen [0-9] aus vier Stellen {1,4}. 
Darauf folgt das '-' und dann folgen wieder vier Zahlen oder nach der dritten Zahl ein 'X'.

cut -d $'\t' -f2 ./ *.tsv | grep -E '(\w *\w)'

- Wie in Aufgabe eins wird wieder ein Tabulator als "Delimiter" deklariert, sodass nur die 2. Felder einer Zeile ausgeben werden.
Daraufhin sollen beliebige Zeichenketten ausgegeben werden.

cut -d $'\t' -f2 ./ *.tsv | grep -E '(\w *\w)' | sort | uniq

- Hier ist es wie oben. Sort sorgt für eine Sortierung, in dem Fall - alphabetisch, uniq sort dafür, dass die Doppel entfernt werden.
 
cut -d $'\t' -f6 ./ *.tsv | grep -E '([0-9]{1,4}-[0-9]{1,4}X?)' | sort | uniq > uniq-issn.txt

- Hier wir ab der 6. Spalte nach der 'ISSN' gesucht, mit grep wird die Suche genauer eingegrenzt, mit sort nach den Zahlen sortiert, 
mit uniq werden die Doppel entfernt und abschließend in eine .txt Datei geleitet.
