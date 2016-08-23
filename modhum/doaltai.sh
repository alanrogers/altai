#\!/bin/bash
x=`basename $1 .mod.vcf.gz` 
zcat $1 | sed -f altai.sed | bgzip > ${x}-fixed.vcf.bgz
