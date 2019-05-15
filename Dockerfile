FROM ubuntu:18.04

RUN apt-get -qq update \
    && apt-get install -qqy python3-setuptools python3-docutils python3-flask python3-pip \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda install datrie
RUN pip install snakemake

WORKDIR /home/snakemake

ENTRYPOINT ["bash"]