# Exercise 2

**Name:** Anna Schmer

**E-Mail:** anna.schmer@smail.th-koeln.de

**Task 2**

$ git clone https://github.com/dis-data-modeling-2020/dis08-assignment-1-AnnaSchmer.git
Cloning into 'dis08-assignment-1-AnnaSchmer'...
Username for 'https://github.com': AnnaSchmer
Password for 'https://AnnaSchmer@github.com': 
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 6 (delta 0), reused 3 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), done.

$ cd dis08-assignment-1-AnnaSchmer/

$ cat introduction.md | wc -l

23 

$ cat introduction.md | wc -l > lines.txt

$ git add lines.txt 

$ git commit -m 'lines.txt in richtigem Format hinzugefügt'

$ git push
