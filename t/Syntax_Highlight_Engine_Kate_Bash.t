use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Bash') };
my $b = new Syntax::Highlight::Engine::Kate::Bash;
ok(defined($b));
