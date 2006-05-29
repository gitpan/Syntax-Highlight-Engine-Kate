use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::BaseTest') };
my $b = new Syntax::Highlight::Engine::Kate::BaseTest;
ok(defined($b));
