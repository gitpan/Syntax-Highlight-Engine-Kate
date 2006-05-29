use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::SML') };
my $b = new Syntax::Highlight::Engine::Kate::SML;
ok(defined($b));
