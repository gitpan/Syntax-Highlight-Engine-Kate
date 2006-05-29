use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::KBasic') };
my $b = new Syntax::Highlight::Engine::Kate::KBasic;
ok(defined($b));
