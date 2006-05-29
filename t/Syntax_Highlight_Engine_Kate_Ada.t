use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Ada') };
my $b = new Syntax::Highlight::Engine::Kate::Ada;
ok(defined($b));
