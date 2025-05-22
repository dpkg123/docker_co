FROM ubuntu:jammy
WORKDIR /
RUN apt-get update && apt-get install -y \
        git \
        git-lfs \
        ffmpeg \
        libsm6 \
        libxext6 \
        cmake \
        python3 \
        python3-pip \
        rsync \
        libgl1-mesa-glx \
        curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    mkdir -p /home/user && \
    apt-get clean && rm -rf /root/.cache /home/user/.cache /var/cache/* /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    useradd -m -u 1000 user && \
    pip install --no-cache-dir \
        datasets \
        "huggingface-hub>=0.19" \
        "hf-transfer>=0.1.4" \
        "protobuf<4" \
        "click<8.1" \
        "pydantic~=1.0" 
USER user
