# Creating COBOL/DB2 programs with GnuCOBOL for the Murach books.

This repository contains re-written versions of COBOL program examples found in:

Curtis Garvin and Steve Eckols. **DB2 for the COBOL Programmer, Part 1 and Part 2**. Murach Books 1991

Running these programs requires:
- IBM DB2 LUW (these were run against V11.5.8) on Linux (Pop!OS)
- GnuCOBOL 3.1.2
- You have added the db2profile to your .bashrc (or whatever shell you use .xxxrc file).

For more information about creating the VM, installing the requirements and other information, go to the [DSCOBOL Website](https://dscobol.github.io)


## A guide to working with this repository.

I have a certain structure on my computer.

For this repository:
```
GEM
│   ├───bin
│   ├───cbl
│   ├───cpy
│   ├───data
│   ├───docs
│   ├───idata
│   ├───jcl
│   ├───p-sqlscripts
│   ├───spool
│   ├───sql
│   ├───SQLScripts
│   └───tcbl
```
- bin: the executables
- cbl: the COBOL source code
- cpy: the copybooks
- data: the data for the programs
- docs: additional documentation
- idata: not public: indexed files - This is optional in some directories.
- jcl: the scripts used to compile and run
- spool: not public: the printed output - This is optional in some directories.


Special DB2 directories:

- p-sqlscripts: public: versions of SQL DDL code
- sql: not public: the sql code to prep and bind the COBOL programs
- SQLScripts: not public: versions of the SQL DDL code.
- tcbl: not public: temporary COBOL output

### What's the difference between the cbl and the tcbl directories?

A convention when writing regular COBOL programs is to use the extension ".cbl".

When writing COBOL programs with embedded DB2 EXEC statements, a convention is to use the extension ".sqb".

In the prep/bind step, prep will convert all the DB2 EXEC statements in the .sqb program to a CALL statement and write a new file out with an extension of .cbl to the tcbl directory.

In the compile step, the compiler will look for the "normal(.cbl)" COBOL program in the tcbl directory.

Creating this temporary file could be done away with but if there is an error in the compile step, sometimes it is helpful to have the "fully expanded" version of the code available to look at to find the problem.


### Why are they not present?
Only the following directories are pushed to a public repository:

cbl, cpy, data, docs, jcl, and p-sqlscripts.

The others are not public because they are either binary, temporary or they contain usernames and passwords. For examples of these, look in the docs or p-sqlscripts directory.

## Running these programs on your system:

Make sure your system meets the requirements listed above.

Clone the repository to your computer.

Complete these steps in this order:

Expanded instructions for the steps follow:

- Create the missing directories
- Create the MURACH db
- Copy and update the code from p-sqlscripts to SQLScripts
- Run the scripts in SQLScripts to create and load the tables
- Running the Code

### Create the missing directories
In the root directory, Run:
```
mkdir bin idata spool sql SQLScripts tcbl
```

### Create the MURACH db
In a Terminal window, Run:
```
su - db2inst1
```
(or whatever the Instance Userid is)
Type the password and press Enter.

You are now "db2inst1" and the terminal displays a very bare prompt

Run:
```
ksh
```
to get a more useable shell environment.

Run:
```
db2
```
This gets you  "into the db2 system".

At the db2> prompt, Run:
```
CREATE DATABASE MURACH
```
Wait a very, very long time and it will return back with "successfully created database"

To exit out of DB2. Run:
```
quit
```
Then to return to the normal user, Run this twice:
```
exit
```

### Copy and update the code from p-sqlscripts to SQLScripts
Use your preferred method to copy the CUSTOMER and INVOICE directories from p-sqlscripts to SQLScripts.

There are multiple .sql and .sh files within those directories.

Update each .sql file with the correct DB userid and password.

### Run the scripts in SQLScripts to create and load the tables
CD into SQLScripts/CUSTOMER

Run:
```
./db2_create_table.sh
```
Run:
```
./db2_insert_data.sh
```
To check the table, Run:
```
./db2_describe.sh
```
The table definition should be displayed.

And Run:
```
./db2_select_records.sh
```
The records in the table should be displayed.

CD into SQLScripts/INVOICE

Run:
```
./db2_create_table.sh
```
Run:
```
./db2_insert_data.sh
```
To check the table, Run:
```
./db2_describe.sh
```
The table definition should be displayed.

And Run:
```
./db2_select_records.sh
```
The records in the table should be displayed.

### Running the Code:
Starting with CUSTINQ

Copy docs/Code-prep-bind.txt into the sql directory and rename to: CUSTINQ.sql. NOTE: Linux is case-sensitive. CUSTINQ must be uppercase.

Update the top line replacing DB with MURACH, username with the Murach DB userid (typically db2inst1) and the password.

Note: This next step only needs to be done once.

Copy docs/Code-GETDBID.txt into the tcbl directory and rename to: GETDBID.cbl.

Edit GETDBID.cbl changing 'username' to the userid and 'password' to the password. Only replace the text within the quotes! Make sure the userid and password are surrounded by quotes. NOTE: DB2/SQL is not as case-sensitive as Linux BUT the password MUST match the case of the password when you created the userid.

The "job" is divided into 2 scripts:
- "prep, bind, compile, and link"
- "run".

In the terminal, cd into the jcl directory and run:
```
./custinq-compile.sh
```
Watch the output. There should be 0 errors on the prep/bind, press Enter to continue and the actual compile should also say "Complier Return code was ZERO".

If so, in the terminal run:
```
./custinq-run.sh
```
and the results will print on the screen.

The instructions for using the program are in the book.

Hint: 400001 is a good customer number. Look at the data you loaded for other good customer numbers.