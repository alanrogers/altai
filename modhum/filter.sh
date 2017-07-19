id=$1
chr=$2
base=${id}.hg19_1000g.${chr}
ifile=${base}-fixed.vcf.bgz
ofile=${base}.filtered.vcf.gz

# write seqid to stderr
echo Processing sequence ${id}; chr ${chr} 1>&2

bcftools view -M2 --types snps --exclude 'QUAL<30 || MQ<30' $ifile \
 | bgzip > ${ofile}
