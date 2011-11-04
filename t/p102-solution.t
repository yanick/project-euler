use strict;
use warnings;

use Test::More tests => 1;                      # last test to print

use ProjectEuler::Problem::102;

is ProjectEuler::Problem::102::solve_problem() => 228;

