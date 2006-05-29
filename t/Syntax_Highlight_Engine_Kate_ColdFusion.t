use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::ColdFusion') };
my $b = new Syntax::Highlight::Engine::Kate::ColdFusion;
ok(defined($b));
