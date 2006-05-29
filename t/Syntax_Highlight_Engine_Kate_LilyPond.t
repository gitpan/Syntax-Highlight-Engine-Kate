use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::LilyPond') };
my $b = new Syntax::Highlight::Engine::Kate::LilyPond;
ok(defined($b));
