use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Scilab') };
my $b = new Syntax::Highlight::Engine::Kate::Scilab;
ok(defined($b));
