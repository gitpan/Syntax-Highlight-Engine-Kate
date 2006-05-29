use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Progress') };
my $b = new Syntax::Highlight::Engine::Kate::Progress;
ok(defined($b));
