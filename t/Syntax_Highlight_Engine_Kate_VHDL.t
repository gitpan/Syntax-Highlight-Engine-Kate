use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::VHDL') };
my $b = new Syntax::Highlight::Engine::Kate::VHDL;
ok(defined($b));
