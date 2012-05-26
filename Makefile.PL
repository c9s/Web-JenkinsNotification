use inc::Module::Install;
name 'Plack-Middleware-JenkinsNotification';
all_from 'lib/Plack/Middleware/JenkinsNotification.pm';

requires 'Plack';
requires 'Net::Jenkins' => 0.04;
requires 'Jenkins::NotificationListener' => 0.04;

readme_from_pod 'lib/Plack/Middleware/JenkinsNotification.pm';
readme_markdown_from_pod 'lib/Plack/Middleware/JenkinsNotification.pm';

tests 't/*.t';
# author_tests 'xt';
test_requires qw(Test::More File::Read HTTP::Request::Common);
# auto_set_repository;
auto_include;
WriteAll;
