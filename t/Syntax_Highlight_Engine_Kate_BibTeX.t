use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::BibTeX') };
my $b = new Syntax::Highlight::Engine::Kate::BibTeX;
ok(defined($b));
