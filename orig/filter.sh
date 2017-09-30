chr=$1
bed="../bed/chr${chr}_mask.bed.gz"
vcf="chr${chr}_mq25_mapab100.vcf.gz"
ofile="vindija-chr${chr}-filtered.vcf.bgz"
zcat ${vcf} | bedvcf <(zcat ${bed}) | bgzip > ${ofile}
