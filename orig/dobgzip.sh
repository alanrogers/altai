#\!/bin/bash
chr=$1
ifile=AltaiNea.hg19_1000g.${chr}.mod-fixed.vcf.gz
ofile=AltaiNea.hg19_1000g.${chr}.vcf.bgz
zcat ${ifile} | bgzip > ${ofile}
