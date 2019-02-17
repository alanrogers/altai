# Check sort

     zcat AltaiNea.map35_99.MQ30.Cov.indels.TRF.bed.bgz |\
	 sort-bed --check-sort -

This reported no errors, so sort is OK.

# Split into chromosome-specific files

    zcat AltaiNea.map35_99.MQ30.Cov.indels.TRF.bed.bgz |
	awk '{print $0 >> $1".bed"}'

    for i in *.bed; do gzip $i; done


