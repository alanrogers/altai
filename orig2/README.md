# New version of Altai genome

This is the new version of the Altai genome, as described by Prufer et
al. 2017. A high-coverage Neandertal genome from Vindija Cave in
Croatia. Science, 358(6363):655-658.

# Download data files and checksum file

    sbatch download.slr

# Check checksums.

    md5sum -c md5sums.txt

All checksums are fine.

# Generate .raf

    sbatch mkraf.slr
