use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Clipper') };
my $b = new Syntax::Highlight::Engine::Kate::Clipper;
ok(defined($b));
