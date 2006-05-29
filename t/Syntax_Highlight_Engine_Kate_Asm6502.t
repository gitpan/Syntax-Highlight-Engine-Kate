use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Asm6502') };
my $b = new Syntax::Highlight::Engine::Kate::Asm6502;
ok(defined($b));
