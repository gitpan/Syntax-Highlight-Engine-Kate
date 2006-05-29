use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::LaTeX') };
my $b = new Syntax::Highlight::Engine::Kate::LaTeX;
ok(defined($b));
