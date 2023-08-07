FROM paidax/dev-containers:cuda11.7-py3.8-dev-v1.2

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN apt update && \
    apt install -y \
    libsndfile1 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/QwenLM/Qwen-7B.git && \
    cd Qwen-7B && \
    pip install -r --no-cache-dir requirements.txt
RUN cd /home && \
    wget https://github.com/git-lfs/git-lfs/releases/download/v3.4.0/git-lfs-linux-amd64-v3.4.0.tar.gz && \
    tar -xvf git-lfs-linux-amd64-v3.4.0.tar.gz && \
    rm -rf git-lfs-linux-amd64-v3.4.0.tar.gz && \
    cd git-lfs-3.4.0 && \
    bash install.sh
RUN cd /home && \
    git lfs install && \
    git clone https://huggingface.co/Qwen/Qwen-7B-Chat

WORKDIR /home/qwen-7b-api

COPY . .
