#!/bin/bash
FILES="/home/ssm-user/data/organoid/"*"_R1_"*".fastq.gz"
#FILES="/home/ssm-user/data/CTF/*_1.fastq"
for f in $FILES
do
        echo "Processing $f file..."
        file1=$(basename "$f")
        echo "$file1"

        #42_S42_L001_R1_001.fastq.gz

        substring=$(echo $file1| cut -d'R' -f 1)
        echo $substring

        file2=$substring"R2_001.fastq.gz"
        echo $file2

        dirname=${substring::-1}
        echo $dirname

        docker run -v `pwd`:/ssm-user --rm trinityctat/ctat_vif \
                /usr/local/bin/ctat-VIF.py \
                --left_fq /ssm-user/data/organoid/$file1 \
                --right_fq /ssm-user/data/organoid/$file2 \
                --genome_lib_dir /ssm-user/VIF/GRCh37_gencode_v19_CTAT_lib_Mar012021.plug-n-play/ctat_genome_lib_build_dir \
                --viral_db_fasta /ssm-user/VIF/viruses.fasta \
                --output_dir /ssm-user/VIF/results/$dirname/ \
                --CPU "16"\

        sudo rm "/home/ssm-user/data/organoid/"$file1
        sudo rm "/home/ssm-user/data/organoid/"$file2
done
