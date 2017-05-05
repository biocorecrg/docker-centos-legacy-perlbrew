FROM biocorecrg/centos-perlbrew

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>
MAINTAINER Luca Cozzuto <lucacozzuto@gmail.com> 

ARG PYTHON_VERSION=2.7.13

RUN bash -c 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'


ENV PATH /root/.pyenv/bin:$PATH

RUN echo $PATH

RUN yum install -y readline readline-devel sqlite sqlite-devel openssl openssl-devel openssl-libs

RUN pyenv install $PYTHON_VERSION

ENV PYENV_ROOT="/root/.pyenv" \
    PATH="/root/.pyenv/bin:/root/.pyenv/shims:$PATH"

RUN python --version

# Clean cache
RUN yum clean all

