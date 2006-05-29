use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::SQL_PostgreSQL') };
my $b = new Syntax::Highlight::Engine::Kate::SQL_PostgreSQL;
ok(defined($b));
