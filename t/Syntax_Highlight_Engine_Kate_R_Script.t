use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::R_Script') };
my $b = new Syntax::Highlight::Engine::Kate::R_Script;
ok(defined($b));
