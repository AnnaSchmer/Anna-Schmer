#!/bin/bash
grep -E -c '(china|chinese)' ./*.tsv 
cut -d $'\t' -f9 ./*.tsv | grep -E -c '(china|chinese)'
cut -d $'\t' -f6 ./*.tsv | grep -E -c '([0-9]{1,4}-[0-9]{1,4}X?)'
cut -d $'\t' -f2 ./*.tsv | grep -E '(\w *\w)'
cut -d $'\t' -f2 ./*.tsv | grep -E '(\w *\w)' | sort | uniq
cut -d $'\t' -f6 ./*.tsv | grep -E '([0-9]{1,4}-[0-9]{1,4}X?)' | sort | uniq > uniq-issn.txt
