#!/bin/sh

PERL=`which perl`

mv /usr/bin/perl /usr/bin/perl.distro
ln -s $PERL /usr/bin/perl

