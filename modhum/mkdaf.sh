ifile=$1
base=`basename ${ifile} .bcf`
ofile=${base}.daf
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\t%INFO/CAnc[\t%GT]\n' ${ifile} | daf > ${ofile}
