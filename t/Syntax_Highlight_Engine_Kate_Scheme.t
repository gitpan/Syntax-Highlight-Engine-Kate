use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Scheme') };
my $b = new Syntax::Highlight::Engine::Kate::Scheme;
ok(defined($b));
