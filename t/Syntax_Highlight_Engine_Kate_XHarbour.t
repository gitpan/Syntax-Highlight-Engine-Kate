use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::XHarbour') };
my $b = new Syntax::Highlight::Engine::Kate::XHarbour;
ok(defined($b));
