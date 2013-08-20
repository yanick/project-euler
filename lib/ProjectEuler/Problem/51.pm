package ProjectEuler::Problem::51;

use 5.10.0;

use strict;
use warnings;

use Math::Prime::TiedArray;

my @primes;
tie @primes, 'Math::Prime::TiedArray', cache => 'primes.dbm';


my $n = 6;
my $target = 8;

sub solve_euler {
    my $i = 0;
    my @population;

    while ( my $p = $primes[$i++] ) {
        next unless $p > '9' x ($n-1);
        last if $p > '9' x $n;
        push @population, $p;
    }

    return find_it( qr/$/, @population )->[0];
}

sub find_it {
    my ( $pattern, @population ) = @_;

    return if @population < $target;

    if( @population == $target ) {
        $pattern = '^' . $pattern;
        $pattern =~ s/x/(.)/;
        $pattern =~ s/x/(?:\\1)/g;
        return unless $target == grep { $_ =~ $pattern } @population;
        return \@population;
    }

    for my $x ( 0..9, 'x' ) {
        my $pattern = join '', $x, $pattern;
        my $p = $pattern;
        $p =~ s/x/(.)/;
        $p =~ s/x/(?:\\1)/g;
        my $r = find_it( $pattern, grep { $_ =~ $p } @population );
        return $r if $r;
    }

    return;
}

