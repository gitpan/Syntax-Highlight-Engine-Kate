use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::SQL') };
my $b = new Syntax::Highlight::Engine::Kate::SQL;
ok(defined($b));
