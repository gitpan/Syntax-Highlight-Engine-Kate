use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Cdash') };
my $b = new Syntax::Highlight::Engine::Kate::Cdash;
ok(defined($b));
