use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::SQL_MySQL') };
my $b = new Syntax::Highlight::Engine::Kate::SQL_MySQL;
ok(defined($b));