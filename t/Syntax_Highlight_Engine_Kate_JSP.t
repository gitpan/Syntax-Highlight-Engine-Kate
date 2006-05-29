use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::JSP') };
my $b = new Syntax::Highlight::Engine::Kate::JSP;
ok(defined($b));
