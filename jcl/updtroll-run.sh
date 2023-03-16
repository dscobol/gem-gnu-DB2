#!/bin/bash

# Set Up variables

# Program to run
PGM=UPDTROLL
export DD_VFILE1="../idata/customrs.idat"
export DD_VFILE2="../idata/errcustmrs2.idat"

# Export the environment variables in the .env file
export $(grep -v '^#' ../.env | xargs)

# run program
../bin/$PGM
