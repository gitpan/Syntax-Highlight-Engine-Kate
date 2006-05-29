use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::TI_Basic') };
my $b = new Syntax::Highlight::Engine::Kate::TI_Basic;
ok(defined($b));
