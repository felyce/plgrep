#!/usr/bin/perl

use strict;
use warnings;
use File::Spec;

my $search_word = shift @ARGV;
my $search_file_pattern = shift @ARGV;
my $directory = shift @ARGV;

chdir $directory or die "Cannot chidir to $directory: $!\n";
my @all_files = glob( File::Spec->catfile("**", $search_file_pattern) );
#print "all_files:@all_files\n";

print "result\n";

foreach my $file (@all_files){
    my $fh;
    unless(open $fh, '>', $file){
        warn "Cannot open $file: $!\n";
        next;
    }
    my $i = 1;
    while( <$fh> ){
        chomp;
        if( /$search_word/ ){
            print "$_:\t$file  [Line:$i]\n";
        }
        $i++;
    }
}

exit;

