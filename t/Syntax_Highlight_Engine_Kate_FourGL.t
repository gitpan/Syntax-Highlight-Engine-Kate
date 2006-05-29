use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::FourGL') };
my $b = new Syntax::Highlight::Engine::Kate::FourGL;
ok(defined($b));
