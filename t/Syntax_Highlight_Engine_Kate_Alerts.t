use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Alerts') };
my $b = new Syntax::Highlight::Engine::Kate::Alerts;
ok(defined($b));
