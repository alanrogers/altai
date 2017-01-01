fixedvcf := $(wildcard *-fixed.vcf.bgz)
fixedtbi := $(fixedvcf:.bgz=.bgz.tbi)
filteredvcf := $(fixedvcf:-fixed.vcf.bgz=.filtered.vcf.gz)
filteredtbi := $(filteredvcf:.gz=.gz.tbi)

%.vcf.bgz.tbi : %.vcf.bgz
	tabix $<

%.filtered.vcf.gz.tbi : %.filtered.vcf.gz
	tabix $<

%.filtered.vcf.gz : %-fixed.vcf.bgz
	bcftools view --exclude 'QUAL<30 || MQ<30' $< | bgzip > $@

filteredtbi_done :  filteredvcf_done $(filteredtbi)
	touch filteredtbi_done

filteredvcf_done :  fixedtbi_done $(filteredvcf)
	touch filteredvcf_done

fixedtbi_done :  fixedvcf_done $(fixedtbi)
	touch fixedtbi_done

fixedvcf_done: $(fixedvcf)
	touch fixedvcf_done
