use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Diff') };
my $b = new Syntax::Highlight::Engine::Kate::Diff;
ok(defined($b));
