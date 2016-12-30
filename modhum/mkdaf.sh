ifile=$1
base=`basename ${ifile} .bcf`
ofile=${base}.daf

# Log input file to stderr
echo Processing ${ifile} 1>&2

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\t%INFO/CAnc[\t%GT]\n' ${ifile} | daf > ${ofile}
