use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Prolog') };
my $b = new Syntax::Highlight::Engine::Kate::Prolog;
ok(defined($b));