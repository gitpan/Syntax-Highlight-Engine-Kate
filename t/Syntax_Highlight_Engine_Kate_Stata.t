use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Stata') };
my $b = new Syntax::Highlight::Engine::Kate::Stata;
ok(defined($b));
