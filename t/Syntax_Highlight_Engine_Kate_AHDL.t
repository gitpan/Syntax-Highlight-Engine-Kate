use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::AHDL') };
my $b = new Syntax::Highlight::Engine::Kate::AHDL;
ok(defined($b));
