package ProjectEuler::Problem::63;

use 5.10.0;

use strict;
use warnings;

use Math::BigInt;

sub solve {

    my $sum;

    for my $x ( 1 .. 9 ) {
        my $power = 1;
        my $mult  = Math::BigInt->new($x);
        while ( $power <= length $mult ) {
            $sum++ if $power == length $mult;
            $power++;
            $mult->bmul($x);
        }
    }

    return $sum;

}

1;

