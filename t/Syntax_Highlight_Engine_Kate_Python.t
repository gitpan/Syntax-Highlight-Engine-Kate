use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Python') };
my $b = new Syntax::Highlight::Engine::Kate::Python;
ok(defined($b));
