# Argument to this script should be the id of a genome.
# The script concatenates all autosomes of this genome
# into a single file.
seqid=$1
fname=${seqid}.files

# Create a file, ${seqid}.files, which lists the per-autosome
# files associated with the current seqid.
if [ -e ${fname} ]
then
  rm ${fname}
fi
for chr in `seq 1 22 | sort`; do 
  echo ${seqid}.hg19_1000g.${chr}.filtered.vcf.gz >> ${fname}
done

# write seqid to stderr
echo Processing sequence ${seqid} 1>&2

# Concatenate autosomes
bcftools concat --file-list ${fname} --output-type b --output ${seqid}_autosomes.bcf
