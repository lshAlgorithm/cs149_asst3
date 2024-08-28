# 使用NVIDIA提供的包含CUDA的Ubuntu 22.04 base image
FROM nvidia/cuda:11.7.1-devel-ubuntu22.04

# 设置工作目录
WORKDIR /asst3

# 更改APT源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list


# DNS设置
RUN sed "1i nameserver 8.8.8.8" /etc/resolv.conf

# 安装一些额外的软件包
RUN apt-get update && \
    apt-get install -y ping vim git make cmake wget unzip pkg-config && \
    apt-get clean

# 将主机上的代码复制到Docker image的工作目录中
# COPY . /asst3/
# 不使用以上命令，而是选用--mount参数，将主机上的代码目录映射到Docker image的工作目录中

# 设置环境变量，确保能够使用NVIDIA驱动和CUDA
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=all

# 设置默认的容器启动命令
CMD ["bash"]
