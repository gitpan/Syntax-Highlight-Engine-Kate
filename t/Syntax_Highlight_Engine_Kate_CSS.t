use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::CSS') };
my $b = new Syntax::Highlight::Engine::Kate::CSS;
ok(defined($b));
