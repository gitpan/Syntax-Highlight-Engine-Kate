use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Xslt') };
my $b = new Syntax::Highlight::Engine::Kate::Xslt;
ok(defined($b));
