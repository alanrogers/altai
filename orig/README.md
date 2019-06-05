# Download -> AltaiNea.hg19_1000g.1.mod.vcf.gz
    sbatch download.slr

Number of sites: 2,683,909,764

# Fix malformed vcf files -> AltaiNea.hg19_1000g.1.mod-fixed.vcf.gz
    sbatch fixvcf.slr

# Concatenate Neanderthal autosomes to make altai.vcf.gz
    sbatch concat.slr

# Index resulting file
    sbatch idxcat.slr

# Filter and generate altai.raf
    sbatch mkraf.slr
