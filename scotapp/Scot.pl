#!/usr/bin/env perl

use strict;
use warnings;

#use FindBin;
#BEGIN { unshift @INC, "$FindBin::Bin/../lib"}

eval 'use Mojolicious::Commands';
die <<EOF if $@;
!!!
!!! Mojolicious Framework is not installed
!!! ... please install and retry..
!!!
EOF
use Data::Dumper;

#use Cwd;
#chdir('scot3/script') or die "$!";
#print "SCOT CWD is ". getcwd . "\n";

$ENV{MOJO_APP}  ||= 'Scot';
Mojolicious::Commands->start_app('Scot');
