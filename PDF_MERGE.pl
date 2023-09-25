#!/usr/local/bin/perl
use strict;
use warnings;
use PDF::Report;
use PDF::API2;

# files to merge
my @input_files = (
    'Sample.pdf',
    'Sample_1.pdf',
);
my $output_file = 'Merged_PDF.pdf';

# the output file
my $output_pdf = PDF::API2->new(-file => $output_file);

foreach my $input_file (@input_files) {
    my $input_pdf = PDF::API2->open($input_file);
    my @numpages = (1..$input_pdf->pages());
    foreach my $numpage (@numpages) {
        # add page number $numpage from $input_file to the end of 
        # the file $output_file
        $output_pdf->importpage($input_pdf,$numpage,0);        
    }
}

$output_pdf->save();

