#!/bin/bash
FILES="/home/ssm-user/data/CTF/"*"_1.fastq.gz"
#FILES="/home/ssm-user/data/CTF/"*"_1.fastq"
for f in $FILES
do
        echo "Processing $f file..."
        file1=$(basename "$f")
        #echo "$file1"

        substring=$(echo $file1| cut -d'_' -f 1)
        echo $substring

        file2=$substring"_2.fastq.gz"
        #echo "$file2"

        out_prefix="/home/ssm-user/STAR_MetaPhlAn/analysis/star_results/"$substring"_"
        #echo "$out_prefix"

        $(gunzip "/home/ssm-user/data/CTF/"$file1)
        $(gunzip "/home/ssm-user/data/CTF/"$file2)
        f1="/home/ssm-user/data/CTF/"$substring"_1.fastq"
        f2="/home/ssm-user/data/CTF/"$substring"_2.fastq"
        #echo "$f1, $f2"

        sudo chmod -R 0777 "/home/ssm-user/STAR_MetaPhlAn/analysis/"
        STAR --runThreadN 16 --genomeDir /home/ssm-user/STAR_MetaPhlAn/analysis/genome_index/index --readFilesIn $f1 $f2 --outFileNamePrefix $out_prefix --outReadsUnmapped Fastx

        export PATH="$HOME/miniconda3/bin:$PATH"
        activate metaphlan
        metaphlan $out_prefix"Unmapped.out.mate1",$out_prefix"Unmapped.out.mate2" --bowtie2out metagenome.bowtie2.bz2 --add_viruses --ignore_eukaryotes --nproc 16 --input_type fastq --read_min_len 30 > "analysis/star_results/"$substring.txt

        sudo rm metagenome.bowtie2.bz2
                #sudo rm -r "/home/ssm-user/analysis/results/*__STARtmp"
        #sudo rm "/home/ssm-user/analysis/results/*_Log.progress.out"
        #sudo rm "/home/ssm-user/analysis/results/*_Log.out"
        #sudo rm "/home/ssm-user/analysis/results/*_Aligned.out.sam"
        python upload_star-metaphlan.py
        sudo mv "/home/ssm-user/STAR_MetaPhlAn/analysis/star_results/"$substring.txt "/home/ssm-user/STAR_MetaPhlAn/analysis/metaphlan_results/"$substring.txt
        sudo rm $f1
        sudo rm $f2
        sudo rm "/home/ssm-user/STAR_MetaPhlAn/analysis/star_results/"*.sam

done
