fixedvcf := *-fixed.vcf.bgz
fixedtbi := $(fixedvcf:.bgz=.bgz.tbi)

%.vcf.bgz.tbi : %.vcf.bgz
	tabix $<

all : $(fixedtbi)
	touch all
