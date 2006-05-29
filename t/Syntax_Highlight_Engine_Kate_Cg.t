use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Cg') };
my $b = new Syntax::Highlight::Engine::Kate::Cg;
ok(defined($b));
