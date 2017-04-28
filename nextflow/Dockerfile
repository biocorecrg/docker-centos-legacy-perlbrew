FROM biocorecrg/centos-perlbrew:latest

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>

RUN yum install -y java-1.8.0-openjdk which

# Clean cache
RUN yum clean all

RUN bash -c '\curl -fsSL get.nextflow.io | bash'

# MV to /usr/local/bin
RUN mv nextflow /usr/local/bin

