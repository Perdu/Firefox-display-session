#!/usr/bin/perl

use warnings;
use strict;

if (@ARGV != 1) {
    print "Usage: display_session.pl <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];
open(my $file, '<', $filename);

while (<$file>) {
	# match either the end of the open tabs' entries, or actual entries.
	while (/(?:"(_closedTabs)":\[{"state":{"entries"|"entries":\[{"url":"(.*?)")/g) {
		# We just want open tabs. After _closeTabs, it's only history.
		if (defined $1 && $1 eq "_closedTabs") {
			last;
		}
		print $2 . "\n";
	}
}

close($file);
