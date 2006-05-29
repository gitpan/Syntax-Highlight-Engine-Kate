use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Lex_Flex') };
my $b = new Syntax::Highlight::Engine::Kate::Lex_Flex;
ok(defined($b));
