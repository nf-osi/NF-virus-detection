!/bin/bash
mkdir $HOME/analysis/
mkdir $HOME/analysis/genome_index
cd $HOME/analysis/genome_index
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/Homo_sapiens.GRCh38.dna.primary_assembly.fa
wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/Homo_sapiens.GRCh38.99.gtf
sudo chmod -R 0755 .

docker run -v $HOME:/ssm-user --rm nfosi/star_metaphlan \
                STAR --runThreadN 16 --runMode genomeGenerate \
                --genomeDir /ssm-user/analysis/genome_index/index \
                --genomeFastaFiles /ssm-user/analysis/genome_index/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
                --sjdbGTFfile /ssm-user/analysis/genome_index/Homo_sapiens.GRCh38.99.gtf \
                --outFileNamePrefix /ssm-user/analysis/genome_index/logs/
