use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Txt2tags') };
my $b = new Syntax::Highlight::Engine::Kate::Txt2tags;
ok(defined($b));
