use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::PHP_HTML') };
my $b = new Syntax::Highlight::Engine::Kate::PHP_HTML;
ok(defined($b));
