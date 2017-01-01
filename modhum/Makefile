fixedvcf := $(wildcard *-fixed.vcf.bgz)
fixedtbi := $(fixedvcf:.bgz=.bgz.tbi)
filteredvcf := $(fixedvcf:-fixed.vcf.bgz=.filtered.vcf.gz)
filteredtbi := $(filteredvcf:.gz=.gz.tbi)

.SECONDARY : $(fixedtbi) $(filteredvcf) $(filteredtbi)

# index a compressed vcf file
%.vcf.bgz.tbi : %.vcf.bgz
	tabix $<
	touch $@.done

# index a compressed vcf file
%.vcf.gz.tbi : %.vcf.gz
	tabix $<
	touch $@.done

# index a bcf file
%.bcf.csi : %.bcf
	tabix $<
	touch $@.done

# filter step required fixed file and index
%.filtered.vcf.gz : %-fixed.vcf.bgz %-fixed.vcf.bgz.tbi
	bcftools view --exclude 'QUAL<30 || MQ<30' $< | bgzip > $@
	touch $@.done

# make a list of sequence ids
seqid := $(shell echo $(fixedvcf)  | tr ". " "\n" | grep ^SS | sort | uniq)

$(info seqid: $(seqid))

all :  $(filteredtbi)
