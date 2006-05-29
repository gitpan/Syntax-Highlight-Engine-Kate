use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Mason') };
my $b = new Syntax::Highlight::Engine::Kate::Mason;
ok(defined($b));
