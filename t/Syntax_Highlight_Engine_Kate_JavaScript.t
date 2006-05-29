use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::JavaScript') };
my $b = new Syntax::Highlight::Engine::Kate::JavaScript;
ok(defined($b));
