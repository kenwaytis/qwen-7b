#!/bin/bash

# 检测是否安装了git lfs
if ! command -v git-lfs &> /dev/null; then
    echo "git lfs not found. Installing..."

    # 下载并安装git lfs
    wget https://github.com/git-lfs/git-lfs/releases/download/v3.4.0/git-lfs-linux-amd64-v3.4.0.tar.gz
    tar -xvf git-lfs-linux-amd64-v3.4.0.tar.gz
    rm -rf git-lfs-linux-amd64-v3.4.0.tar.gz
    cd git-lfs-3.4.0
    bash install.sh
    cd ..
fi

# 安装git lfs并克隆仓库
git lfs install
git clone https://huggingface.co/Qwen/Qwen-7B-Chat
