use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Debian_Changelog') };
my $b = new Syntax::Highlight::Engine::Kate::Debian_Changelog;
ok(defined($b));
