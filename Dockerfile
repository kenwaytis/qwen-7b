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
    pip install --no-cache-dir -r requirements.txt

WORKDIR /home/qwen-7b-api

COPY . .
