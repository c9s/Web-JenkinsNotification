use inc::Module::Install;
name 'Plack-App-JenkinsNotification';
all_from 'lib/Plack/App/JenkinsNotification.pm';

# requires '';

tests 't/*.t';
# author_tests 'xt';
# test_requires 'Test::More';
# auto_set_repository;
auto_include;
WriteAll;
