use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Cisco') };
my $b = new Syntax::Highlight::Engine::Kate::Cisco;
ok(defined($b));
