use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::D') };
my $b = new Syntax::Highlight::Engine::Kate::D;
ok(defined($b));
