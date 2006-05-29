use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Yacas') };
my $b = new Syntax::Highlight::Engine::Kate::Yacas;
ok(defined($b));
