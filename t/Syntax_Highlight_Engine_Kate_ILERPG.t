use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::ILERPG') };
my $b = new Syntax::Highlight::Engine::Kate::ILERPG;
ok(defined($b));
