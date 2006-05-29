use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Pike') };
my $b = new Syntax::Highlight::Engine::Kate::Pike;
ok(defined($b));
