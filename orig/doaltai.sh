#\!/bin/bash
# Getting two errors from bcftools:
#   [W::vcf_parse] FILTER 'LowQual' is not defined in the header
#	[W::vcf_parse] INFO '.' is not defined in the header, assuming Type=String
# Searching the web, I found example of vcf files containing a LowQual definition in 
# the header. To find the cause of the 2nd error, I looked at the output lines surrounding 
# the error:
#	bcftools view AltaiNea.hg19_1000g.22.mod.vcf.gz 2>&1 | grep -C 20 "not defined"
# A few lines after the error, I found this:
#	22      18685734        .       C       .       .       .       .;RM;TS=HHHP;TSseq=C,C,C,-;CAnc=C...
#	22      18685735        .       A       .       .       .       .;RM;TS=HHHP;TSseq=A,A,A,-;CAnc=A...
#	22      18685736        .       A       .       .       .       .;RM;TS=HHHP;TSseq=A,A,A,-;CAnc=A...
# The problem is the ".;" at the beginning of field 8 (the INFO field).
#
# To fix these problems, I wrote a sed script (altai.sed) and a bash script (doaltai.sh), which 
# decompresses the file, filters it through altai.sed, and compressed the result.
#
# The .vcf files have two problems:
# Problem 1: The "LowQual" value, which shows up in the FILTER
# field, is not defined.
#
# Problem 2: Some INFO fields begin with ".;", which also generates
# a warning in bcftools.
#
# The code below filters all .vcf.gz files through a sed script, which adds 
# a definition of LowQual and replaces the string "\t.;" with "\t". In other 
# words, it deletes ".;" at the beginning of a field.

x=`basename $1 .vcf.gz` 
zcat $1 | sed -f altai.sed | bgzip > ${x}-fixed.vcf.gz
