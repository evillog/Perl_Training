use strict;
use warnings;
use Fcntl;

#   ======================================================================
#   
#   Let’s implement a subroutine copyByHand that do file copy by sysread and syswrite.
#
#   ======================================================================

sub copyByHand {
    my $oldFile = 'old_file.iso';
    my $newFile = 'new_file.iso';

    open(IN, "< $oldFile");
    open(OUT, "> $newFile");
     
    $blockSize = (stat IN)[11] || 8192;   # defined block size
    while ($len = sysread IN, $buf, $blockSize) {
        if (!defined $len) {
            next if $! =~ /^Interrupted/;
            die "System read error: $!\n";
        }
        $offset = 0;
        while ($len) {
            defined($written = syswrite OUT, $buf, $len, $offset)
                or die "System write error: $!\n";
            $len -= $written;
            $offset += $written;
        };
    }
}
