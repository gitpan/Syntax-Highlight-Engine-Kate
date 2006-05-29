use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::AWK') };
my $b = new Syntax::Highlight::Engine::Kate::AWK;
ok(defined($b));
