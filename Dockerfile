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
            gcc \
            make \
            sudo \
  && rm bazel.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo ". /etc/bash_completion" >> /root/.bashrc
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
