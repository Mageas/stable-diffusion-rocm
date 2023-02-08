FROM rocm/dev-ubuntu-20.04
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8
WORKDIR /sdtemp
RUN apt-get update &&\
    apt-get install -y \
    wget \
    git \
    python3 \
    python3-pip \
    python-is-python3
RUN python -m pip install --upgrade pip wheel
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /sdtemp

#torch and torchvision version number refer to
#https://github.com/AUTOMATIC1111/stable-diffusion-webui/blob/master/launch.py
ENV TORCH_COMMAND="pip install torch==1.12.1+rocm5.1.1 torchvision==0.13.1+rocm5.1.1 --extra-index-url https://download.pytorch.org/whl/rocm5.1.1"
RUN python -m $TORCH_COMMAND

RUN python launch.py --skip-torch-cuda-test --exit
RUN python -m pip install opencv-python-headless
WORKDIR /stablediff-web

