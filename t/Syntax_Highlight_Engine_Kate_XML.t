use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::XML') };
my $b = new Syntax::Highlight::Engine::Kate::XML;
ok(defined($b));
