ifile=$1

# Search info field for ".;" or "." at the end of the field.
bcftools view ${ifile} | awk '{print $8}' | egrep '\.(;|$)'
