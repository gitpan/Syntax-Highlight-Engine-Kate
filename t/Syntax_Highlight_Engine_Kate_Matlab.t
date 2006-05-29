use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Matlab') };
my $b = new Syntax::Highlight::Engine::Kate::Matlab;
ok(defined($b));
