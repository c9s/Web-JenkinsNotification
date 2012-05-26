#!/usr/bin/env perl
use lib 'lib';
use Test::More;
use Plack::Test;
use Plack::App::JenkinsNotification;
use HTTP::Request::Common;
use HTTP::Response;
use File::Read;

my $triggered = 0;
my $handler = Plack::App::JenkinsNotification->new({ on_notify => sub { 
    $triggered++;
}});

ok $handler;

test_psgi 
    app => $handler,
    client => sub {
        my $cb  = shift;
        my $json = read_file 't/data/notification.json';

        # URI-escape
        my $res = $cb->(POST "http://localhost/" , Content => $json );
        my($ct, $charset) = $res->content_type;
        ok $res->content =~ m{success}i;
    };

ok $triggered;

done_testing;
