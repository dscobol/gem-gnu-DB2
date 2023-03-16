#!/bin/bash

# Set Up variables

# Program to run
PGM=UPDTCUST
export DD_VFILE1="../idata/customrs.idat"
export DD_VFILE2="../idata/errcustmrs.idat"

# Export the environment variables in the .env file
export $(grep -v '^#' ../.env | xargs)

# run program
../bin/$PGM
