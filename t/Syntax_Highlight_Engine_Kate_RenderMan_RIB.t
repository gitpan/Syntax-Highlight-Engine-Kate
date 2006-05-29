use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::RenderMan_RIB') };
my $b = new Syntax::Highlight::Engine::Kate::RenderMan_RIB;
ok(defined($b));
