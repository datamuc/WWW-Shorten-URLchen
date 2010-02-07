use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'WWW::Shorten::URLchen',
    license             => 'perl',
    dist_author         => q{Danijel Tasov <data@cpan.org>},
    dist_version_from   => 'lib/WWW/Shorten/URLchen.pm',
    dist_abstract       => 'WWW::Shorten plugin for URLchen.de',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'WWW::Shorten' => '3.00',
    },
    add_to_cleanup      => [ 'WWW-Shorten-URLchen-*' ],
    meta_merge => {
        resources => {
            repository => 'http://github.com/datamuc/WWW-Shorten-URLchen',
        },
    },
);

$builder->create_build_script();
