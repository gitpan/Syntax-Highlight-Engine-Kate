use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::VRML') };
my $b = new Syntax::Highlight::Engine::Kate::VRML;
ok(defined($b));
