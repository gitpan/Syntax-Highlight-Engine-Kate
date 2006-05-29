use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::CUE_Sheet') };
my $b = new Syntax::Highlight::Engine::Kate::CUE_Sheet;
ok(defined($b));
