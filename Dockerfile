FROM paidax/dev-containers:cuda11.7-py3.8-dev-v1.2

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN apt update && \
    apt install -y \
    libsndfile1 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir \
        torch \
        torchvision \
        torchaudio \
        transformers \
        accelerate \
        tiktoken \
        einops
RUN pip install --no-cache-dir ninja && \
    git clone -b v1.0.8 https://github.com/Dao-AILab/flash-attention && \
    cd flash-attention && pip install . && \
    pip install --no-cache-dir csrc/layer_norm && \
    pip install --no-cache-dir csrc/rotary && \
    cd .. && \
    rm -rf flash-attention

WORKDIR /home/qwen-7b