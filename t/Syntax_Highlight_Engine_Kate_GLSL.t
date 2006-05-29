use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::GLSL') };
my $b = new Syntax::Highlight::Engine::Kate::GLSL;
ok(defined($b));
