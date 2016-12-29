# 2016-12-27: I'm removing the step that filters based on the archaic bed file.
# This filtering happen automatically during generation of .daf file, so
# it isn't necessary here.
id=$1
chr=$2
base=${id}.hg19_1000g.${chr}
ifile=${base}-fixed.vcf.bgz
ofile=${base}.filtered.vcf.gz
#bcftools view -M2 --types snps --exclude 'QUAL<30 || MQ<30' $ifile \
# | bgzip > ${ofile}
bcftools view --exclude 'QUAL<30 || MQ<30' $ifile \
 | bgzip > ${ofile}
