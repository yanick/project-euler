#!/usr/bin/perl 

use 5.10.0;

use strict;
use warnings;

my @series;

for my $x ( 3..8 ) {
    my @sub;
    $series[$x] = \@sub;
    while ( my $y = eval "iterator$x".'()' ) {
        next if $y < 1000;
        last if $y > 9999;
        push @sub, $y;
    }
}

use List::AllUtils qw/ sum /;
print sum split ' ', find_it( '', 3..8 );

sub find_it {
    my( $so_far, @left ) = @_;

    unless ( @left ) {
        $so_far =~ /^(..).*(..)$/;
        return $1 == $2 ? $so_far : undef;
    }

    unless ( $so_far ) {
        my $s = shift @left;
        for my $x ( @{$series[$s]} )  {
            my $y = find_it( $x, @left );
            return $y if $y;
        }
    }

    for my $s ( @left ) {
        my @l = grep { $_ != $s } @left;
        for my $i ( @{ $series[$s] } ) {
            $i =~ /(..)/;
            my $c = $1;
            if ( $so_far =~ /$c$/ ) {
                my $y = find_it( $so_far . ' '.  $i, @l );
                return $y if $y;
            }
        }
    }
}



sub iterator3 {
    state $i = 1;
    my $x = $i * ( $i + 1 ) / 2;
    $i++;
    return $x;
}

sub iterator4 {
    state $i = 1;
    my $x = $i ** 2;
    $i++;
    return $x;
}

sub iterator5 {
    state $i = 1;
    my $x = $i * ( 3*$i-1) / 2;
    $i++;
    return $x;
}

sub iterator6 {
    state $i = 1;
    my $x = $i * ( 2*$i-1);
    $i++;
    return $x;
}
sub iterator7 {
    state $i = 1;
    my $x = $i * ( 5*$i-3) / 2;
    $i++;
    return $x;
}

sub iterator8 {
    state $i = 1;
    my $x = $i * ( 3*$i-2);
    $i++;
    return $x;
}
