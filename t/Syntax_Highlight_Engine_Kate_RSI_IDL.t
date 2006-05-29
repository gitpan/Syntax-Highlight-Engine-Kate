use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::RSI_IDL') };
my $b = new Syntax::Highlight::Engine::Kate::RSI_IDL;
ok(defined($b));
