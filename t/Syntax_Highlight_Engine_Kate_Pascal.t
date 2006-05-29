use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Pascal') };
my $b = new Syntax::Highlight::Engine::Kate::Pascal;
ok(defined($b));
