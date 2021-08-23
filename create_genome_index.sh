#!/bin/bash
sudo mkdir /home/ssm-user/analysis/genome_index
cd /home/ssm-user/analysis/genome_index
sudo wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/Homo_sapiens.GRCh38.dna.primary_assembly.fa
sudo wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/Homo_sapiens.GRCh38.99.gtf
sudo chmod -R 0777 .

docker run -v `pwd`:/ssm-user --rm nfosi/star_metaphlan \
                STAR --runThreadN 16 --runMode genomeGenerate \
                --genomeDir /ssm-user/analysis/genome_index/index \
                --genomeFastaFiles /ssm-user/analysis/genome_index/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
                --sjdbGTFfile /ssm-user/analysis/genome_index/Homo_sapiens.GRCh38.99.gtf \
                --outFileNamePrefix /ssm-user/analysis/genome_index/logs/
