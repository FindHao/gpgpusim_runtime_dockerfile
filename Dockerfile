FROM ubuntu:14.04
MAINTAINER Find Hao "find@findhao.net"
ADD https://gist.githubusercontent.com/FindHao/d6aafc9899c47780efde7c4c8526b864/raw/da2b067787c4c6da037122bc286fdea7980dc672/ubuntu14.04 /etc/apt/sources.list
ADD https://gist.githubusercontent.com/FindHao/1ffe0103e737e2a697b6c5179573bf75/raw/5052e6836794cc5c6e666e9f3649e30fb6b80032/cuclean /usr/bin/cuclean
RUN apt-get update \
&& apt-get install -y gcc gcc-4.6 g++ g++-4.6 build-essential  vim \
&& apt-get clean  \
&& rm -rf /var/lib/apt/lists \
&& echo "export CUDA_INSTALL_PATH=/root/sim/cuda/\nexport LD_LIBRARY_PATH=/root/sim/libsim/ \nexport PATH=$PATH:/root/sim/cuda/bin/" >> /root/.bashrc \
&& cd /usr/bin\
&& chmod +x cuclean\
&& rm gcc g++ \
&& ln -s ./gcc-4.6 ./gcc \
&& ln -s ./g++-4.6 ./g++
