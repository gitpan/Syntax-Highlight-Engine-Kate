use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::XML_Debug') };
my $b = new Syntax::Highlight::Engine::Kate::XML_Debug;
ok(defined($b));
