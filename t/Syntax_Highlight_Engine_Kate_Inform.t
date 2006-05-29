use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Inform') };
my $b = new Syntax::Highlight::Engine::Kate::Inform;
ok(defined($b));
