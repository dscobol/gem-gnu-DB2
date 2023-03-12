      ***********************************************************
      * Program name:    VSCBEX01
      * Original author: David Stagowki
      *
      *    Description: Example 01: Indexed File Processing: Load File
      *
      *    This program will create and load an Indexed file
      *     with data from a flat file.
      *
      * Maintenance Log
      * Date       Author        Maintenance Requirement
      * ---------- ------------  --------------------------------
      * 2023-03-11 dscobol       Created to learn.
      * 20XX-XX-XX               If you change me, change this.
      *
      **********************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VSCBEX01.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.   IBM WITH DEBUGGING MODE.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT LOADFile
           ASSIGN TO QFILE1
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-LOADFile-Status.

           SELECT CUSTFile
           ASSIGN TO VFILE1
           ORGANIZATION IS INDEXED
           RECORD KEY IS CUSTFile-Cust-Number
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS WS-CUSTFile-Status.

       DATA DIVISION.
       FILE SECTION.
       FD  LOADFile
           LABEL RECORDS ARE STANDARD
           RECORDING MODE IS F
           BLOCK CONTAINS 0 RECORDS.
       01  FD-LOADFile-Customer-Record.
           COPY CUSTOMRS REPLACING ==:tag:== BY ==LOADFile==.

       FD  CUSTFile.
       01  FD-CUSTFile-Customer-Record.
           COPY CUSTOMRS REPLACING ==:tag:== BY ==CUSTFile==.

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS.
           COPY WSFST REPLACING ==:tag:== BY ==LOADFile==.
           COPY WSFST REPLACING ==:tag:== BY ==CUSTFile==.

       01  WS-File-Counters.
           12 FD-LOADFile-Record-Cnt         PIC S9(4) COMP VALUE ZERO.
           12 FD-CUSTFile-Insert-Cnt         PIC S9(4) COMP VALUE ZERO.

       01 EOJ-Display-Messages.
           12 EOJ-End-Message PIC X(042) VALUE
              "*** Program VSCBEX01 - End of Run Messages".

       PROCEDURE DIVISION.
       0000-Mainline.
           PERFORM 1000-Begin-Job.
           PERFORM 2000-Process.
           PERFORM 3000-End-Job.
           GOBACK.

       1000-Begin-Job.
           OPEN  INPUT LOADFile.
           OPEN OUTPUT CUSTFile.
           PERFORM 5000-Read-LOADFile.

       2000-Process.
           IF WS-LOADFile-Good
              PERFORM UNTIL WS-LOADFile-EOF
                 PERFORM 2100-Insert-CUSTFile
                 PERFORM 5000-Read-LOADFile
              END-PERFORM
           END-IF.

       2100-Insert-CUSTFile.
           MOVE FD-LOADFile-Customer-Record TO
                FD-CUSTFile-Customer-Record.
           PERFORM 6000-Write-CUSTFile.

       3000-End-Job.
           DISPLAY EOJ-End-Message.
           DISPLAY "      Records Read: " FD-LOADFile-Record-Cnt
           DISPLAY "  Records Inserted: " FD-CUSTFile-Insert-Cnt

           CLOSE LOADFile
                 CUSTFile.
      D    DISPLAY "CUSTFile Close Status: " WS-CUSTFile-Status.

       5000-Read-LOADFile.
           READ LOADFile
              AT END SET WS-LOADFile-EOF TO TRUE
           END-READ.
           IF WS-LOADFile-Good
              ADD +1 TO FD-LOADFile-Record-Cnt
      D       DISPLAY "LOADFile Record: " FD-LOADFile-Customer-Record
           ELSE
              IF WS-LOADFile-EOF
                 NEXT SENTENCE
              ELSE
                 DISPLAY "** ERROR **: 5000-Read-LOADFile"
                 DISPLAY "Read LOADFile Failed."
                 DISPLAY "File Status: " WS-LOADFile-Status
                 PERFORM 3000-End-Job
                 MOVE 8 TO RETURN-CODE
                 GOBACK
              END-IF
           END-IF.

       6000-Write-CUSTFile.
           WRITE FD-CUSTFile-Customer-Record.
           IF WS-CUSTFile-Good
              ADD +1 TO FD-CUSTFile-Insert-Cnt
      D       DISPLAY "CUSTFile on Write: " FD-CUSTFile-Customer-Record
           ELSE
              DISPLAY "** ERROR **: 6000-Write-CUSTFile"
              DISPLAY "Write CUSTFile Failed."
              DISPLAY "File Status: " WS-CUSTFile-Status
                 PERFORM 3000-End-Job
                 MOVE 8 TO RETURN-CODE
                 GOBACK
           END-IF.
