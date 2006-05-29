use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::BaseTestchild') };
my $b = new Syntax::Highlight::Engine::Kate::BaseTestchild;
ok(defined($b));
