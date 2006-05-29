use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Velocity') };
my $b = new Syntax::Highlight::Engine::Kate::Velocity;
ok(defined($b));
