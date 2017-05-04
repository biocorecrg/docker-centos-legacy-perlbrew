#!/usr/bin/env perl

use Text::Trim;

my $file = shift;

open( FILE, "<", $file ) || die "Cannot open $file";

while( <FILE> ) {

	if ( $_=~/^\>/ ) {
		my $desc = $_;

		$desc=~s/\>//g;
		$desc = trim( $desc );

		print $desc, "\n";
	}
}

close( FILE );

