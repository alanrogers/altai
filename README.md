# altai
README files associated with data from Prufer et al paper on Altai Neanderthal genome

# Download minimal filter
wget https://bioinf.eva.mpg.de/altai_minimal_filters/AltaiNea.map35_99.MQ30.Cov.indels.TRF.bed.bgz

bcftools view --output-file AltaiNea-22-filtered.vcf -M2 -v snps --exclude 'QUAL<30 & MQ<30' AltaiNea.hg19_1000g.22.mod.vcf.gz

cd orig; tabix AltaiNea.hg19_1000g.22.mod.vcf.gz

bcftools view --output-file ../AltaiNea-2Mb.vcf -M2 -v snps --exclude 'QUAL<30 & MQ<30' --regions 22:20000000-22000000 AltaiNea.hg19_1000g.22.mod.vcf.gz


# Generate data for analysis. Output looks like
# 22	20006558	G	G/G
# 22	20006574	G	A/A
# 22	20006992	A	C/C
# Tab-separated columns are chr, pos, ref, alt, ancestral_allele, genotypes...
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\t%INFO/CAnc[\t%GT]\n' AltaiNea-2Mb.vcf

# Get list of CEU samples
grep CEU orig/integrated_call_samples_v3.20130502.ALL.panel | cut -f 1

# All populations: ACB ASW BEB CDX CEU CHB CHS CLM ESN FIN GBR GIH GWD
# IBS ITU JPT KHV LWK MSL MXL PEL PJL PUR STU TSI YRI

# Get list of sample names
grep -v sample orig/integrated_call_samples_v3.20130502.ALL.panel | cut -f 2 | sort | uniq

# Minimal filters: SI5b of Prufer et al Nature paper.
https://bioinf.eva.mpg.de/altai_minimal_filters/
