FROM nvcr.io/nvidia/cuda:11.1.1-devel-ubuntu20.04

# No questions during installation
ENV DEBIAN_FRONTEND noninteractive

# --------------------------
# Install system dependencies for convinient development inside container
# --------------------------

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    tmux \
    openssh-server \
    tree \
    less \
    vim \
    curl \
    wget \
    build-essential \
    python3-pip \
    mesa-utils \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda && rm /Miniconda3-latest-Linux-x86_64.sh
ENV PATH=$PATH:/miniconda/condabin:/miniconda/bin

EXPOSE 22

# --------------------------
# Variables
# --------------------------

# directory
ARG PROJECT_NAME=ml_env

# Add project dir
WORKDIR ~/
RUN mkdir -p ${PROJECT_NAME}

# Conda environment
ADD ../environment_gpu.yaml environment_gpu.yaml
RUN conda env create -f environment_gpu.yaml &&\
    conda clean -tipy && rm environment_gpu.yaml
RUN echo "source activate ml_env" > ~/.bashrc

ADD ../src/main.py ${PROJECT_NAME}/



