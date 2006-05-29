use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::SGML') };
my $b = new Syntax::Highlight::Engine::Kate::SGML;
ok(defined($b));
