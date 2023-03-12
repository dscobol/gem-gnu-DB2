#!/bin/bash

# Program parms
PGM=VSCBEX01
export DD_QFILE1="../data/customrs.dat.txt"
export DD_VFILE1="../idata/customrs.idat"

# clean up
rm ../bin/$PGM
rm $DD_VFILE1

# static parms
SYSLIB="../cpy"

cobc -x -o ../bin/$PGM ../cbl/$PGM.cbl -I $SYSLIB 

if [ "$?" -eq 0 ]; then
    ../bin/$PGM
else
    echo "Complier Return code not ZERO."
fi
