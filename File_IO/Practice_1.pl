use strict;
use warnings;
use Fcntl;

#   ======================================================================
#   
#   Implement a subroutine filter() to find specific lines of given file then write them into a new one 
#
#   ======================================================================

sub filter
{
    my $filename = 'report.txt';
    open(FH1, '<', $filename)
        or die "Could not open file '$filename' $!"; 
    
    my $filename2 = 'report2.txt';
    open(FH2, '>>', $filename2)
        or die "Could not open file '$filename' $!";
    
    my $count = 0;   
    while(my $line = <FH1>)
    { 
        chomp $line;
        if($line eq 'File System')
        {
            $count += 1;
            print FH2 "This is File System. $count \n";
   
        }
    }
   
    close (FH1);
    close (FH2);
}

filter();