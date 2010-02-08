package WWW::Shorten::URLchen;
use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );
our $VERSION = '0.0.2';

use Carp;

sub makeashorterlink ($) {
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua = __PACKAGE__->ua();
    my $service_url = 'http://urlchen.de/';
    my $resp = $ua->post($service_url, [
	url => $url,
	source => "PerlAPI-$VERSION",
    ]);
    return undef unless $resp->is_redirect;
    return $resp->header('X-Location');
}

sub makealongerlink ($) {
    my $urlchen = shift 
	or croak 'No Urlchen key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();

    $urlchen = "http://urlchen.de/$urlchen"
    unless $urlchen =~ m!^http://!i;

    my $resp = $ua->get($urlchen);

    return undef unless $resp->is_redirect;
    my $url = $resp->header('Location');
    return $url;
}

1;

__END__

=head1 NAME

WWW::Shorten::URLchen - Perl interface to URLchen.de

=head1 SYNOPSIS

  use WWW::Shorten 'URLchen';

  $short_url = makeashorterlink($long_url);
  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site urlchen.de. URLchen simply maintains
a database of long URLs, each of which has a unique identifier.

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the URLchen web site passing
it your long URL and will return the shorter URLchen version.

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full URLchen URL or just the
URLchen identifier.

If anything goes wrong, then either function will return C<undef>.

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Danijel Tasov <data@cpan.org>

=head1 SEE ALSO

L<WWW::Shorten>, L<perl>, L<http://urlchen.de/>

=cut

