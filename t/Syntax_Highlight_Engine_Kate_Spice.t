use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Spice') };
my $b = new Syntax::Highlight::Engine::Kate::Spice;
ok(defined($b));
