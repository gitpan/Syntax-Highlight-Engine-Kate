use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Ruby') };
my $b = new Syntax::Highlight::Engine::Kate::Ruby;
ok(defined($b));
