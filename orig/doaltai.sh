#\!/bin/bash
x=`basename $1 .vcf.gz` 
zcat $1 | sed -f altai.sed | gzip > ${x}-fixed.vcf.gz
