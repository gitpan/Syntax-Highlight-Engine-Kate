use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Ferite') };
my $b = new Syntax::Highlight::Engine::Kate::Ferite;
ok(defined($b));
