package ProjectEuler::Problem::206;

use 5.10.0;

use strict;
use warnings;

use bigint;

my $re =
qr/^0(.(9(.(8(.(7(.(6(.(5(.(4(.(3(.(2(.(1)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?$/;

# min: 1010101010
# max: 1389026623

sub solve {
    my $x = shift;

    return if length $x > 10;

    for my $y ( 0..9 ) {
        my $i = $y . $x;
#        next if $i eq '00';
        my $m = $i**2;
        die $i if $m =~ /^1.2.3.4.5.6.7.8.9.0$/;
        my $r = reverse $m;
        $r = substr $r, 0, length $i-1;
        return if $m > 192939495969798990;
        #$r =~ s/0+$// if length $r > 1;
        next unless $r =~ $re;
        say ' ' x length $i, join "\t\t", $i, $m, $r;
#        exit if length $m == 19;
        solve( $i );
    }
}

=pod

    use ProjectEuler::Problem::206;

    is ProjectEuler::Problem::206::solve() => 1389019170;
