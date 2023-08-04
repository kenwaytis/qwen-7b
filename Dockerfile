FROM paidax/dev-containers:modelscope-v0.8

ARG DEBIAN_FRONTEND=noninteractive

RUN git clone -b v1.0.8 https://github.com/Dao-AILab/flash-attention && \
    cd flash-attention && pip install . && \
    pip install csrc/layer_norm && \
    pip install csrc/rotary && \
    cd /home && \
    mkdir qwen-7b

WORKDIR /home/qwen-7b
