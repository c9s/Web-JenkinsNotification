package Plack::App::JenkinsNotification;
use strict;
use warnings;
our $VERSION = '0.02';
use parent qw/Plack::Component/;
use Plack::Util;
use Plack::MIME;
use Plack::Util::Accessor qw(on_notify);
use Plack::Response;
use Plack::Request;
use Net::Jenkins;
use Jenkins::NotificationListener;

sub call { 
    my ($self,$env) = @_;
    my $req = Plack::Request->new($env);
    my $body = $req->raw_body;

    my $notification = parse_jenkins_notification $body;

    if( $self->on_notify ) {
        $self->on_notify->( $env, $notification );
    }

    my $response = Plack::Response->new(200);
    $response->body('{ "success": 1 }');
    return $response->finalize;
}

1;
__END__

=head1 NAME

Plack::App::JenkinsNotification -

=head1 SYNOPSIS

    use Plack::App::JenkinsNotification;

    builder {
        mount "/jenkins" => Plack::App::JenkinsNotification->new({ on_notify => sub {
            
            
        }});
    };

=head1 DESCRIPTION

Plack::App::JenkinsNotification is

=head1 AUTHOR

Yo-An Lin E<lt>cornelius.howl {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
