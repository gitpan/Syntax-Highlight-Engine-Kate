use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::INI_Files') };
my $b = new Syntax::Highlight::Engine::Kate::INI_Files;
ok(defined($b));
