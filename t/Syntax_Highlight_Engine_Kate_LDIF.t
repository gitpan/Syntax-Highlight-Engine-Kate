use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::LDIF') };
my $b = new Syntax::Highlight::Engine::Kate::LDIF;
ok(defined($b));
