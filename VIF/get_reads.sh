#!/bin/bash

# gets reads and other metrics from fastq using the fastq_count go library, and writes a tsv with this information for each file. 
# https://github.com/d2jvkpn/fastq_count 

for i in *.fastq.gz ; do
        name=${i%.fastq.gz}
        echo $name
        pigz -dck $i | fastq_count -output ${name}_reads.tsv -
done
