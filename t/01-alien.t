use strict;
use warnings;
use Test::More;
use Test::Alien;

use CInet::Alien::GANAK;

alien_ok 'CInet::Alien::GANAK';
run_ok([CInet::Alien::GANAK->exe, '-V'])
    ->success
    ->out_like(qr/GANAK version ([0-9.a-z]+)/);

done_testing;
