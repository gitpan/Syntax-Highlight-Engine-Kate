use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::ComponentminusPascal') };
my $b = new Syntax::Highlight::Engine::Kate::ComponentminusPascal;
ok(defined($b));
