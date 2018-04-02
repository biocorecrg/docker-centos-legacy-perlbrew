FROM biocorecrg/centos-perlbrew:centos7

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>
MAINTAINER Luca Cozzuto <lucacozzuto@gmail.com> 

ARG PYENV_ROOT=/usr/local/python
ARG PYTHON_VERSION=3.6.3

ENV PYENV_ROOT $PYENV_ROOT

RUN bash -c 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'

ENV PATH $PYENV_ROOT/bin:$PATH
ENV PYTHON_VERSION $PYTHON_VERSION

RUN yum install -y readline readline-devel sqlite sqlite-devel openssl openssl-devel openssl-libs

RUN pyenv install $PYTHON_VERSION

ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/versions/$PYTHON_VERSION/bin:$PATH"

# Clean cache
RUN yum clean all

