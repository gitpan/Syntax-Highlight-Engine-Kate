use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::CGiS') };
my $b = new Syntax::Highlight::Engine::Kate::CGiS;
ok(defined($b));
