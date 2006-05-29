use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::PHP_PHP') };
my $b = new Syntax::Highlight::Engine::Kate::PHP_PHP;
ok(defined($b));
