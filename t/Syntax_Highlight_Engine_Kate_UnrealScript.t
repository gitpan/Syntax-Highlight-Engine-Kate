use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::UnrealScript') };
my $b = new Syntax::Highlight::Engine::Kate::UnrealScript;
ok(defined($b));
