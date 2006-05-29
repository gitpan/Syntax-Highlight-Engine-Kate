use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::PureBasic') };
my $b = new Syntax::Highlight::Engine::Kate::PureBasic;
ok(defined($b));
