use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Sieve') };
my $b = new Syntax::Highlight::Engine::Kate::Sieve;
ok(defined($b));
