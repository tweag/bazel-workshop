FROM debian:stable-20220822
ARG bazel_version=5.3.0
ARG bazel_url=https://storage.googleapis.com/bazel-apt/pool/jdk1.8/b/bazel/bazel_${bazel_version}_amd64.deb
RUN apt-get update && apt-get install -y \
      wget \
  && wget "${bazel_url}" -nv -o- -O bazel.deb \
  && apt-get -o Acquire::Retries=5 -o Acquire::http::Dl-Limit=800 install -y \
            ./bazel.deb \
            bash-completion \
            build-essential \
            default-jdk-headless \
            git \
            vim \
            tree \
            gcc \
            make \
            sudo \
  && rm bazel.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo ". /etc/bash_completion" >> /root/.bashrc

# ==================================================================
# MKL https://software.intel.com/en-us/mkl
# ------------------------------------------------------------------
RUN cd /tmp && wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && \
      apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && \
      sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list' && \
      apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y intel-mkl-64bit-2020.4-912 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# ==================================================================
# KenML Build dependencies
# ------------------------------------------------------------------
RUN apt-get update && apt-get install -y \
  libboost-system-dev libboost-thread-dev libboost-program-options-dev \
  libboost-test-dev libeigen3-dev zlib1g-dev libbz2-dev liblzma-dev

ENV NB_USER user
ENV NB_UID  1000
ENV HOME  /home/${NB_USER}
ENV     SHELL   /bin/bash
SHELL   ["/bin/bash", "-c"]
RUN useradd --create-home --password 123456 --uid ${NB_UID} ${NB_USER}
USER  root
RUN chown -R ${NB_UID} ${HOME}
USER  ${NB_USER}
RUN echo 'alias ll="ls -l"' >> ~/.bashrc
WORKDIR ${HOME}
