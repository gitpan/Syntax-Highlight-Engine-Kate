use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Verilog') };
my $b = new Syntax::Highlight::Engine::Kate::Verilog;
ok(defined($b));
