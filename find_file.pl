#!/usr/bin/perl

use strict;
use warnings;

use File::Find;
use Cwd qw/ abs_path /;


my $directory = shift @ARGV;
my @result;

find( \&wanted, $directory );

exit;

# ----------------------------------------

sub wanted
{
    print $File::Find::name, "\n";
}

