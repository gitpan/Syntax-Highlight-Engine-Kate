use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::E_Language') };
my $b = new Syntax::Highlight::Engine::Kate::E_Language;
ok(defined($b));
