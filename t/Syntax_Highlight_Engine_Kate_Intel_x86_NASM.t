use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Intel_x86_NASM') };
my $b = new Syntax::Highlight::Engine::Kate::Intel_x86_NASM;
ok(defined($b));
