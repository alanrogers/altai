fname=$1

# write seqid to stderr
echo Checking file ${fname} 1>&2

# test compressed file. Nothing is printed to stdout. Diagnostics go to stderr
cat -t ${fname} >/dev/null
