#!/bin/bash

INFILE=$1
OUTFILE=$2
LOGFILE=$3

nextflow -log log/$LOGFILE run processFasta.nf --input input/$INFILE --output output/$OUTFILE

