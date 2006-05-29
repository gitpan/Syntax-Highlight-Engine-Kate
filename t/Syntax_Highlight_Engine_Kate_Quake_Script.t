use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Quake_Script') };
my $b = new Syntax::Highlight::Engine::Kate::Quake_Script;
ok(defined($b));
