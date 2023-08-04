FROM paidax/dev-containers:modelscope-cuda11.7-py3.11-v0.2
WORKDIR /home/qwen-7b
COPY download_model.py ./download_model.py
RUN python download_model.py
