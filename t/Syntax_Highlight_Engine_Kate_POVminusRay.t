use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::POVminusRay') };
my $b = new Syntax::Highlight::Engine::Kate::POVminusRay;
ok(defined($b));
