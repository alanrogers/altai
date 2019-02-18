#!/usr/bin/python
# print only duplicate lines of a vcf file

import sys

if len(sys.argv) != 1:
    print >> sys.stderr, "Usage: python dups.py < input"
    sys.exit(1)

duplicate = False
oldchrom = pos = None

for line in sys.stdin:
    line = line.strip()
    if line[0] == '#':
        print line
        continue
    fields = line.split('\t')
    if len(fields) == 0:
        continue
    if len(fields) < 2:
        print >> sys.stderr, "fewer than 2 fields:", line
        sys.exit(1)
    chrom = fields[0]
    pos = fields[1]
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
    oldpos = pos[:]
