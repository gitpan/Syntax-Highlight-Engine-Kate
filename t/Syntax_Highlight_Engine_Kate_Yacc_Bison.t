use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Yacc_Bison') };
my $b = new Syntax::Highlight::Engine::Kate::Yacc_Bison;
ok(defined($b));
