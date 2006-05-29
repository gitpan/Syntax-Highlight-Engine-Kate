use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::ASP') };
my $b = new Syntax::Highlight::Engine::Kate::ASP;
ok(defined($b));
