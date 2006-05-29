use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::REXX') };
my $b = new Syntax::Highlight::Engine::Kate::REXX;
ok(defined($b));
