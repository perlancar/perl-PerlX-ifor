#!perl

use strict;
use warnings;

use Pack::Util qw(pack_size);
use Test::More 0.98;

is(pack_size("a"), 1);
is(pack_size("a8"), 8);
is(pack_size("A[80]"), 80);

DONE_TESTING:
done_testing;
