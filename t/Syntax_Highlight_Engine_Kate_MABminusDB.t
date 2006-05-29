use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::MABminusDB') };
my $b = new Syntax::Highlight::Engine::Kate::MABminusDB;
ok(defined($b));
