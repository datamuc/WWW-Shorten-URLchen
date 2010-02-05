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
    add_to_cleanup      => [ 'WWW-Shorten-URLchen-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
