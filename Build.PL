use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'WWW::Shorten::Urlchen',
    license             => 'perl',
    dist_author         => q{Danijel Tasov <data@cpan.org>},
    dist_version_from   => 'lib/WWW/Shorten/Urlchen.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'WWW-Shorten-Urlchen-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
