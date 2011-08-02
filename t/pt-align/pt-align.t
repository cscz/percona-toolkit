#!/usr/bin/env perl

BEGIN {
   die "The PERCONA_TOOLKIT_BRANCH environment variable is not set.\n"
      unless $ENV{PERCONA_TOOLKIT_BRANCH} && -d $ENV{PERCONA_TOOLKIT_BRANCH};
   unshift @INC, "$ENV{PERCONA_TOOLKIT_BRANCH}/lib";
};

use strict;
use warnings FATAL => 'all';
use English qw(-no_match_vars);
use Test::More tests => 2;

use PerconaTest;

my $sample = "$trunk/t/pt-align/samples/";

like(
   `perl -c $trunk/bin/pt-align 2>&1`,
   qr/syntax OK/,
   'syntax OK'
);

ok(
   no_diff(
      "$trunk/bin/pt-align $sample/vmstat-01.in",
      "t/pt-align/samples/vmstat-01.out",
   ),
   "vmstat-01"
);

# #############################################################################
# Done.
# #############################################################################
exit;