chr=$1
ifile="AltaiNea.hg19_1000g.${chr}.vcf.bgz"
ofile="AltaiNea.hg19_1000g.${chr}-filtered.bcf"
bcftools view --output-file $ofile \
  --types snps --exclude 'QUAL<30 & MQ<30' \
  --regions-file ~/data/archbed/altai-denisova-map35_99-${chr}.bed.gz \
  --output-type b \
  $ifile
