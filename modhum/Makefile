fixedvcf := *-fixed.vcf.bgz
fixedtbi := $(fixedvcf:.bgz=.bgz.tbi)
filteredvcf := $(fixedvcf:-fixed.vcf.bgz=.filtered.vcf.gz)
filteredtbi := $(filteredvcf:.gz=.gz.tbi)

%.vcf.bgz.tbi : %.vcf.bgz
	tabix $<

%.vcf.gz.tbi : %.vcf.gz
	tabix $<

%.filtered.vcf.gz : %-fixed.vcf.bgz
	bcftools view --exclude 'QUAL<30 || MQ<30' $< | bgzip > $@

all : $(fixedtbi) $(filteredvcf) $(filteredtbi)
	touch all
