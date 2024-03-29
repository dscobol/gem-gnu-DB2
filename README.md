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

1. Create the missing directories
2. Create the MURACH db
3. Copy and update the code from p-sqlscripts to SQLScripts
4. Run the scripts in SQLScripts to create and load the tables
5. Running the Code

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

Update each .sql file with the correct DB, userid, and password.

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

This next step only needs to be done once.

#### Create the .env file
**IMPORTANT NOTE:**
The .env file will contain the userid and password to the database. **MAKE SURE** to add ".env" to your .gitignore so when you commit changes, the .env file will NOT be included.

Copy docs/Code-env.txt to the GEM root and rename to .env .

- Edit .env  changing name to murach , userid to the userid and passwd to the password.

#### Run CUSTINQ
Copy docs/Code-prep-bind.txt into the sql directory and rename to: CUSTINQ.sql. NOTE: Linux is case-sensitive. CUSTINQ must be uppercase.

- Update the top line replacing DB with MURACH, username with the Murach DB userid (typically db2inst1) and the password.

- Replace "PGM" with "CUSTINQ" in all 3 (.sqb, .cbl, .bnd) locations.

The "job" is divided into 2 scripts:
1. "prep, bind, compile, and link"
2. "run".

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

#### Run INVREG
Copy docs/Code-prep-bind.txt into the sql directory and rename to: INVREG.sql. NOTE: Linux is case-sensitive. INVREG must be uppercase.

- Update the top line replacing DB with MURACH, username with the Murach DB userid (typically db2inst1) and the password.

- Replace "PGM" with "INVREG" in all 3 (.sqb, .cbl, .bnd) locations.

The "job" is divided into 2 scripts:
1. "prep, bind, compile, and link"
2. "run".

In the terminal, cd into the jcl directory and run:
```
./invreg-compile.sh
```
Watch the output. There should be 0 errors on the prep/bind, press Enter to continue and the actual compile should also say "Complier Return code was ZERO".

If so, in the terminal run:
```
./invreg-run.sh
```
and some results will print on the screen, and a report will be created in the /spool directory.

#### Run SALESINQ
Copy docs/Code-prep-bind.txt into the sql directory and rename to: SALESINQ.sql. NOTE: Linux is case-sensitive. SALESINQ must be uppercase.

- Update the top line replacing DB with MURACH, username with the Murach DB userid (typically db2inst1) and the password.

- Replace "PGM" with "SALESINQ" in all 3 (.sqb, .cbl, .bnd) locations.

The "job" is divided into 2 scripts:
1. "prep, bind, compile, and link"
2. "run".

In the terminal, cd into the jcl directory and run:
```
./salesinq-compile.sh
```
Watch the output. There should be 0 errors on the prep/bind, press Enter to continue and the actual compile should also say "Complier Return code was ZERO".

If so, in the terminal run:
```
./salesinq-run.sh
```
and some results will print on the screen.

The instructions for using the program are in the book.

Hint: 400001 is a good customer number. Look at the data you loaded for other good customer numbers.

#### Run UPDTCUST

**Before you run UPDTCUST**

An input for UPDTCUST is an Indexed file.

Run:
```
./VSCBEX01.sh
```
to create that Indexed file.

Copy docs/Code-prep-bind.txt into the sql directory and rename to: UPDTCUST.sql. NOTE: Linux is case-sensitive. UPDTCUST must be uppercase.

- Update the top line replacing DB with MURACH, username with the Murach DB userid (typically db2inst1) and the password.

- Replace "PGM" with "UPDTCUST" in all 3 (.sqb, .cbl, .bnd) locations.

The "job" is divided into 2 scripts:
1. "prep, bind, compile, and link"
2. "run".

In the terminal, cd into the jcl directory and run:
```
./updtcust-compile.sh
```
Watch the output. There should be 0 errors on the prep/bind, press Enter to continue and the actual compile should also say "Complier Return code was ZERO".

If so, in the terminal run:
```
./updtcust-run.sh
```
and some results will print on the screen and an errcustmrs.idat file will be written to the idata directory.

#### Run UPDTROLL

**Before you run UPDTROLL**

UPDTCUST made changes to the CUSTOMERS table.

To restore the table:

go to the SQLScripts/CUSTOMER directory

Run:
```
./db2_create_table.sh
```
Then:
```
./db2_insert_data.sh
```

Copy docs/Code-prep-bind.txt into the sql directory and rename to: UPDTROLL.sql. NOTE: Linux is case-sensitive. UPDTROLL must be uppercase.

- Update the top line replacing DB with MURACH, username with the Murach DB userid (typically db2inst1) and the password.

- Replace "PGM" with "UPDTROLL" in all 3 (.sqb, .cbl, .bnd) locations.

The "job" is divided into 2 scripts:
1. "prep, bind, compile, and link"
2. "run".

In the terminal, cd into the jcl directory and run:
```
./updtroll-compile.sh
```
Watch the output. There should be 0 errors on the prep/bind, press Enter to continue and the actual compile should also say "Complier Return code was ZERO".

If so, in the terminal run:
```
./updtroll-run.sh
```
and some results will print on the screen and an errcustmrs2.idat file will be written to the idata directory.
