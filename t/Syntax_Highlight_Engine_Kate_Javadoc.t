use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Javadoc') };
my $b = new Syntax::Highlight::Engine::Kate::Javadoc;
ok(defined($b));
