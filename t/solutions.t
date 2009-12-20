use strict;
use warnings;

use Test::More tests => 1;                      # last test to print

my %solution = (
    205 => '0.5731441',
);

for my $p ( sort { $a <=> $b } keys %solution ) {
    my $m = "ProjectEuler/Problem/$p.pm";
    require $m;
    $m =~ s/\.pm//;
    $m =~ s#/#::#g;
    my $time = time;
    is $m->solve => $solution{$p}, "problem $p";
    diag "took ", ( time - $time ), " seconds";
}



