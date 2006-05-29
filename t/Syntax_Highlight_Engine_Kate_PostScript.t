use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::PostScript') };
my $b = new Syntax::Highlight::Engine::Kate::PostScript;
ok(defined($b));
