FROM centos:latest

ARG PERLBREW_ROOT=/usr/local/perl
ARG PERL_VERSION=5.24.1
# Enable perl build options. Example: --build-arg PERL_BUILD="--thread --debug"
ARG PERL_BUILD=

# Base Perl and builddep
RUN yum install -y perl
RUN yum-builddep -y perl
RUN yum install -y bzip2 zip
RUN yum groupinstall -y 'Development Tools'

RUN mkdir -p $PERLBREW_ROOT

RUN bash -c '\curl -L https://install.perlbrew.pl | bash'

ENV PATH $PERLBREW_ROOT/bin:$PATH
ENV PERLBREW_PATH $PERLBREW_ROOT/bin

RUN perlbrew install $PERL_BUILD perl-$PERL_VERSION
RUN perlbrew install-cpanm
RUN perlbrew switch perl-$PERL_VERSION
		
ENV PERLBREW_ROOT=$PELRBREW_ROOT \
	PATH=$PELRBREW_ROOT/perls/perl-$PERL_VERSION/bin:$PATH \
	PERLBREW_PERL=perl-$PERL_VERSION \
	PERLBREW_MANPATH=$PELRBREW_ROOT/perls/perl-$PERL_VERSION/man \
	PERLBREW_SKIP_INIT=1

