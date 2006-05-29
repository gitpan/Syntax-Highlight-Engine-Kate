use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Cplusplus') };
my $b = new Syntax::Highlight::Engine::Kate::Cplusplus;
ok(defined($b));
