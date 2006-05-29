use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Haskell') };
my $b = new Syntax::Highlight::Engine::Kate::Haskell;
ok(defined($b));
