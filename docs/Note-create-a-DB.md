## Note: Create a database

Because there are tables used in this book that have the same names as the Sample DB, create a new Database and call it MURACH.

su into db2inst1
```
su - db2inst1
```
Entered the password.

This will make you "db2inst1" and display a very bare prompt

Run:
```
ksh
```
to get a more useable environment.

Run:
```
db2
```
This gets you "into the db system".

At the db2> prompt, Run
```
CREATE DATABASE MURACH
```
Wait a long time and it should return "successfully created database".
