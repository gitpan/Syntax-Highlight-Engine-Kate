use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::GNU_Gettext') };
my $b = new Syntax::Highlight::Engine::Kate::GNU_Gettext;
ok(defined($b));
