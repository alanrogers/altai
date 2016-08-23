id=$1
chr=$2
base=${id}.hg19_1000g.${chr}
ifile=${base}-fixed.vcf.bgz
ofile=${base}-filtered.bcf
bcftools view --output-file $ofile \
  -M2 --types snps --exclude 'QUAL<30 & MQ<30' \
  --regions-file ~/data/archbed/altai-denisova-map35_99-${chr}.bed.gz \
  --output-type b \
  $ifile
