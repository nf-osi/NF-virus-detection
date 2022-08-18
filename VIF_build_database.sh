#!/bin/bash

docker run -v $HOME:/data --rm trinityctat/ctat_vif \
	/usr/local/bin/prep_genome_lib/ctat-vif-lib-integration.py \
        --genome_lib_dir /data/VIF/GRCh37_gencode_v19_CTAT_lib_Mar012021.plug-n-play/ctat_genome_lib_build_dir/ \
        --virus_db /data/VIF/viruses.fasta \
	--CPU 16   

