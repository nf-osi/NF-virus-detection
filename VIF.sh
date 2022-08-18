#!/bin/bash
#FILES="/home/ssm-user/data/organoid/"*"_R1_"*".fastq.gz"
#FILES="/home/ssm-user/data/CTF/*_1.fastq"
FILES="/home/ssm-user/data/cnf_cells/*1.fastq.gz"

for f in $FILES
do
        echo "Processing $f file..."
        file1=$(basename "$f")
        echo "$file1"

        #42_S42_L001_R1_001.fastq.gz

        substring=$(echo $file1| cut -d'R' -f 1)
        echo $substring

        file2=$substring"R2.fastq.gz"
        echo $file2

        dirname=${substring::-1}
        echo $dirname

        docker run -v $HOME:/data --rm trinityctat/ctat_vif \
                /usr/local/bin/ctat-vif \
		--sample $dirname \
                --left /data/cnf_cells/$file1 \
                --right /data/cnf_cells/$file2 \
                --genome_lib_dir /data/VIF/ctat_genome_lib_build_dir \
                --viral_fasta /data/VIF/viruses.fasta \
                --outputdir /data/VIF/results/$dirname/ \
                --cpu 16\

done
