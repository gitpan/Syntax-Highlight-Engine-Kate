use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::CMake') };
my $b = new Syntax::Highlight::Engine::Kate::CMake;
ok(defined($b));
