#!/usr/bin/perl 

use strict;
use warnings;
no warnings qw/ uninitialized /;

use 5.010;

use List::MoreUtils qw/ pairwise /;
use List::Util      qw/ sum /;

my @peter = probability_table( 9, 4 );
my @colin = probability_table( 6, 6 );

my $win;

for my $i ( 0..$#peter ) {
    $win += $peter[$i] * sum @colin[0..$i-1];
}

say sprintf "%0.7f", $win;



sub probability_table {
    my @table = instances_table( @_ );

    my $sum = sum @table;

    return map { $_/$sum } @table;
}

sub instances_table {
    my ( $nbr_dice, $sides ) = @_;

    if ( $nbr_dice == 1 ) {
        return ( 0, ( 1 ) x $sides );
    }

    my @table;
    my @pre = instances_table( $nbr_dice-1, $sides );

    for ( 1..$sides ) {
        my @result = ( (0) x $_, @pre );
        @table = pairwise { $a + $b } @table, @result;
    }

    return @table;
}


