use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::WINE_Config') };
my $b = new Syntax::Highlight::Engine::Kate::WINE_Config;
ok(defined($b));
