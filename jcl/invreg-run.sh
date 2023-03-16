#!/bin/bash

# Set Up variables

# Program to run
PGM=INVREG
export DD_RINVREG="../spool/invoice.rpt"

# Delete previous versions
rm $DD_RINVREG

# Export the environment variables in the .env file
export $(grep -v '^#' ../.env | xargs)

# run program
../bin/$PGM
