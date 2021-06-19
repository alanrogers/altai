# altai
Scripts associated with data from Prufer et al paper on Altai
Neanderthal genome.

Subdirectories:

bed: contains .bed files used for quality control

modhum: modern human data that we have never used.

orig: the original version of the Altai genome.

orig2: New version of the Altai genome, as described by Prufer et
al. 2017. A high-coverage Neandertal genome from Vindija Cave in
Croatia. Science, 358(6363):655-658.

# Archive

Used `rclone copy` to move entire altai tree to pando archive
storage. Then used `rclone delete` to remove the .git tree from the
archive.

