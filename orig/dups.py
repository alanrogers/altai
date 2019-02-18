#!/usr/bin/python
# print only duplicate lines of a vcf file

import sys

duplicate = False
oldchrom = pos = None

for line in sys.stdin:
    if line[0] == '#':
        print line
        continue
    fields = line.strip().split()
    chrom = fields[0]
    pos = int(fields[1])
    if duplicate:
        if chrom == oldchrom and pos == oldpos:
            print line
        else:
            duplicate = False
    else:
        if chrom == oldchrom and pos == oldpos:
            duplicate = True
            print oldline
            print line
        else:
            duplicate = False
    oldline = line[:]
    oldchrom = chrom[:]
    oldpos = pos
            
        
        
    
