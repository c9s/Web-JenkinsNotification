use inc::Module::Install;
name 'Plack-App-JenkinsNotification';
all_from 'lib/Plack/App/JenkinsNotification.pm';

requires 'Plack';
requires 'Net::Jenkins' => 0.04;
requires 'Jenkins::NotificationListener' => 0.04;

readme_from_pod 'lib/Plack/App/JenkinsNotification.pm';
readme_markdown_from_pod 'lib/Plack/App/JenkinsNotification.pm';

tests 't/*.t';
# author_tests 'xt';
test_requires qw(Test::More File::Read HTTP::Request::Common);
# auto_set_repository;
auto_include;
WriteAll;
