!/bin/bash
#FILES="$HOME/cnf_tumors/*1.fastq.gz"
#FILES="/home/ssm-user/data/CTF/"*"_1.fastq"
#FILES="$HOME/tibial_nerve/*_1.fastq.gz"
FILES_DIR="tibial_nerve"
PAT="_1.fastq.gz"

FILES=$HOME/$FILES_DIR/*$PAT

for f in $FILES
do
        echo "Processing $f file..."
        file1=$(basename "$f")
        echo $file1

        substring=${file1%$PAT}
        echo $substring

        file2=$substring"_2.fastq.gz"
        echo $file2

        out_prefix=/data/STAR_MetaPhlAn/analysis/star_results/$substring
        echo $out_prefix

        gunzip -f "$HOME/$FILES_DIR/$file1"
        gunzip -f "$HOME/$FILES_DIR/$file2"

        f1=/data/$FILES_DIR/$substring"_1.fastq"
        f2=/data/$FILES_DIR/$substring"_2.fastq"
        echo "$f1, $f2"

        sudo chmod -R 0777 "$HOME/STAR_MetaPhlAn/analysis/"

        docker run -v $HOME:/data --rm nfosi/star_metaphlan \
                STAR --runThreadN 16 --genomeDir /data/STAR_MetaPhlAn/analysis/genome_index/index --readFilesIn $f1 $f2 --outFileNamePrefix $out_prefix --outReadsUnmapped Fastx

        docker run -v $HOME:/data --rm nfosi/star_metaphlan \
                metaphlan $out_prefix"Unmapped.out.mate1",$out_prefix"Unmapped.out.mate2" --bowtie2out metagenome.bowtie2.bz2 --add_viruses --ignore_eukaryotes --nproc 16 --input_type fastq --read_min_len 30 > "$HOME/STAR_MetaPhlAn/analysis/star_results/"$substring.txt

done
