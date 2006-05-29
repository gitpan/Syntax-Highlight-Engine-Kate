use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::AVR_Assembler') };
my $b = new Syntax::Highlight::Engine::Kate::AVR_Assembler;
ok(defined($b));
