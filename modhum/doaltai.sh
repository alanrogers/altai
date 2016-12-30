#\!/bin/bash
x=`basename $1 .mod.vcf.gz` 

# Write input file to stderr
echo Processing $1 1>&2

zcat $1 | sed -f altai.sed | bgzip > ${x}-fixed.vcf.bgz
