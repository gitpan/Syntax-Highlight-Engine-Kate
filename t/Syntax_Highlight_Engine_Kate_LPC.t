use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::LPC') };
my $b = new Syntax::Highlight::Engine::Kate::LPC;
ok(defined($b));
