FROM biocorecrg/centos-perlbrew

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>
MAINTAINER Luca Cozzuto <lucacozzuto@gmail.com> 

ARG GBROWSE_RELEASE=2_56

# Change default Perl for making things easier
RUN yum install -y which

COPY changePerl.sh .
RUN bash ./changePerl.sh

# INSTALL Software
RUN yum install -y httpd \
                   mod_fcgid \
                   fcgi-perl ; \
yum clean all

RUN yum install -y \
           bzip2 \
           expat \
           expat-devel \
           gcc \
           gd \
           gd-devel \
           git \
           gmp-devel \
           graphviz \
           graphviz-devel \
           httpd \
           inkscape \
           libxml2 \
           libxml2-devel \
           make \
           mariadb-devel \
           ncurses-devel \
		   openssl \
           openssl-devel \
           unzip \
           wget \
		   which \
           zlib-devel ; \
yum clean all

RUN cpanm GD \
		Date::Parse \
		Module::Build \
		IO::String \
		Capture::Tiny \
		CGI::Session \
		JSON \
		JSON::Any \
		LWP \
		File::NFSLock \
		Net::SMTP::SSL \
		Crypt::SSLeay \
		Net::SSLeay \
		Template  \
		Template::Toolkit \
		Test::Most \
		SVG \
		CGI \
		DBI \
		DBD::mysql \
		DBD::SQLite \
		Data::Stag \
		GD::Graph \
		GD::Graph::smoothlines \
		GD::SVG \
		Statistics::Lite \
		Statistics::LineFit \
		Compress::Zlib \
		IO::Zlib \
		Config::Simple \
		Pod::Usage \
		Algorithm::Cluster \
		Env \
		DB_File \
		CGI::Session \
		Crypt::SSLeay \
		FCGI \
		Net::OpenID::Consumer \
		Net::SMTP::SSL \
		Parse::Apache::ServerStatus \
		Storable \
		File::Temp \
		Digest::MD5 \
		Statistics::Descriptive

# Force DB_File		
RUN cpanm --force DB_File::Lock

RUN cd / ; \
    git clone https://github.com/bioperl/bioperl-live.git ; \
        cd bioperl-live ; \
        git checkout tags/bioperl-release-1-6-901 ; \
        rm -rf .git ; \
        yes '' | perl Build.PL ; \
       ./Build test ; \
       ./Build install 
RUN cd / ; \
    cpanm Bio::Graphics ; \
    git clone https://github.com/GMOD/GBrowse ; \
    cd GBrowse ; \
    git checkout tags/release-$GBROWSE_RELEASE ; \
    rm -rf .git ; \
    perl Build.PL ; \
    yes '' | ./Build test ; \
    yes 'n' | ./Build install ; \
    chown -R apache:apache /var/lib/gbrowse2 ; \
    cd /usr/share/httpd ; \
    mkdir -p .config/inkscape .gnome2 ; \
    chown apache:apache .config/inkscape .gnome2

COPY gbrowse2.conf /etc/httpd/conf.d/gbrowse2.conf
COPY httpd-foreground /usr/local/bin/httpd-foreground
RUN chmod +x /usr/local/bin/httpd-foreground

EXPOSE 80
CMD ["httpd-foreground"]

