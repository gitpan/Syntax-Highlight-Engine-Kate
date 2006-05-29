use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::IDL') };
my $b = new Syntax::Highlight::Engine::Kate::IDL;
ok(defined($b));
