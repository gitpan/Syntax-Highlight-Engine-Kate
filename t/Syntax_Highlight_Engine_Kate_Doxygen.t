use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Doxygen') };
my $b = new Syntax::Highlight::Engine::Kate::Doxygen;
ok(defined($b));
