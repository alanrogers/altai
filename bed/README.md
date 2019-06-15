# Filters for Altai Genome

## From original paper on high-quality Altai genoms

### Check sort

     zcat AltaiNea.map35_99.MQ30.Cov.indels.TRF.bed.bgz |\
	 sort-bed --check-sort -

This reported no errors, so sort is OK.

### Split into chromosome-specific files

    zcat AltaiNea.map35_99.MQ30.Cov.indels.TRF.bed.bgz |
	awk '{print $0 >> $1".bed"}'

    for i in *.bed; do gzip $i; done

## More recent genome

The rest of this refers to the Altai genome as described in Prufer et
al. 2017. A high-coverage Neandertal genome from Vindija Cave in
Croatia. Science, 358(6363):655-658.

### Download bed files

    sbatch download.slr


