use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Java') };
my $b = new Syntax::Highlight::Engine::Kate::Java;
ok(defined($b));
