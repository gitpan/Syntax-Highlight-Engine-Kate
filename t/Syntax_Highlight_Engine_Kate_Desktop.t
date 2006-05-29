use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Desktop') };
my $b = new Syntax::Highlight::Engine::Kate::Desktop;
ok(defined($b));
