ifile=$1
ofile="AltaiNea.hg19_1000g.${chr}-filtered.bcf"
ofile=`basename
bcftools view --output-file $ofile \
  -M2 --types snps --exclude 'QUAL<30 & MQ<30' \
  --regions-file ~/data/archbed/altai-denisova-map35_99-${chr}.bed.gz \
  --output-type b \
  $ifile
