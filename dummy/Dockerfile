FROM biocorecrg/centos-perlbrew-nextflow:latest

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>

# Directories
VOLUME /project/input
VOLUME /project/output
VOLUME /project/log

ADD processFasta.nf .
ADD script.pl .

# Dependencies of scripts
RUN cpanm Text::Trim

ADD execute.sh .
RUN chmod +x execute.sh

ENV INFILE sample.fa 
ENV OUTFILE outcome.txt
ENV LOGFILE nextflow.log

CMD sh -c "./execute.sh ${INFILE} ${OUTFILE} ${LOGFILE}"
