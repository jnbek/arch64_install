#!/usr/bin/perl 
# Execute this after initial boot into new system
# Adds users, sets groups, sets up other crap before
# We install Packages
use strict;
use warnings;
use Data::Dumper;
use FindBin;
my $script = $FindBin::RealScript;
