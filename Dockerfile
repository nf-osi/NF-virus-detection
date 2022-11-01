FROM ubuntu:18.04

MAINTAINER parnal.joshi@sagebase.org

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y gcc g++ python3 make bowtie \
                                       wget curl libdb-dev \
                                       bzip2 zlibc zlib1g zlib1g-dev  default-jre \
                                       python3-setuptools python3-dev build-essential python3-distutils \
                                       unzip libbz2-dev  liblzma-dev libxml2-dev \
                                       gfortran fort77 libreadline-dev libcurl4-openssl-dev libx11-dev \
                                       libxt-dev x11-common libcairo2-dev libpng-dev libreadline-dev libjpeg-dev \
                                       pkg-config libtbb-dev cmake rsync libssl-dev tzdata bowtie2 && \
    apt-get clean




# make python3 be the default python
RUN ln -sf /usr/bin/python3 /usr/bin/python

RUN curl https://bootstrap.pypa.io/pip/3.6/get-pip.py -o get-pip.py && \
  python get-pip.py

ENV SRC /usr/local/src
ENV BIN  /usr/local/bin

RUN pip install synapseclient numpy cython metaphlan

## STAR Aligner
WORKDIR $SRC

ENV STAR_VERSION=2.7.9a
RUN STAR_URL="https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz" &&\
    wget -P $SRC $STAR_URL &&\
        tar -xvf $SRC/${STAR_VERSION}.tar.gz -C $SRC && \
            mv $SRC/STAR-${STAR_VERSION}/bin/Linux_x86_64_static/STAR /usr/local/bin
            
