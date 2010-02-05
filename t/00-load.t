#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::Shorten::Urlchen' ) || print "Bail out!
";
}

diag( "Testing WWW::Shorten::Urlchen $WWW::Shorten::Urlchen::VERSION, Perl $], $^X" );
