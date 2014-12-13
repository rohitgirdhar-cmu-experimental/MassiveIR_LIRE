#!/bin/bash

outdir='results'
imgsdir='/home/rohit/dataset'
testlist='Test.lst'

while read line; do
    fname=$(basename $line)
    cname=$(basename $(dirname $line))
    odir=$outdir/$cname/$(echo $fname | cut -d'.' --complement -f2-)
    mkdir -p $odir
    echo $imgsdir/$line
    java -classpath bin:lib/* net.semanticmetadata.lire.sampleapp.Searcher $(echo $imgsdir/$line) 5000  > $odir/top.txt
done < $testlist

