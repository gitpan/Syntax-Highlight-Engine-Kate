use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Lua') };
my $b = new Syntax::Highlight::Engine::Kate::Lua;
ok(defined($b));
