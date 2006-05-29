use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::C') };
my $b = new Syntax::Highlight::Engine::Kate::C;
ok(defined($b));
