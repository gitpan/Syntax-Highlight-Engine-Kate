use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::HTML') };
my $b = new Syntax::Highlight::Engine::Kate::HTML;
ok(defined($b));
