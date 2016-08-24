# In filter.sh, I had "--exclude 'QUAL<30 & MQ<30'"
id=$1
chr=$2
base=${id}.hg19_1000g.${chr}
ifile=${base}-filtered.vcf.bgz
ofile=${base}-refiltered.bcf
bcftools view --output-file $ofile \
  --exclude 'QUAL<30 || MQ<30' \
  --output-type b \
  $ifile
