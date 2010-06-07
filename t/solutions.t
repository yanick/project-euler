use strict;
use warnings;

use Test::More;    # last test to print

my %solution = (
    205 => '0.5731441',
    96  => 24702,
    237 => '0.99999283618672',
    63 => 49,
);

for my $p ( $ENV{EULER} or sort { $a <=> $b } keys %solution ) {
    my $m = "ProjectEuler/Problem/$p.pm";
    require $m;
    $m =~ s/\.pm//;
    $m =~ s#/#::#g;
    my $time = time;
    is $m->solve => $solution{$p}, "problem $p";
    diag "took ", ( time - $time ), " seconds";
}

done_testing();

