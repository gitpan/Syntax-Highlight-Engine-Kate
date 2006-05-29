use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Makefile') };
my $b = new Syntax::Highlight::Engine::Kate::Makefile;
ok(defined($b));
