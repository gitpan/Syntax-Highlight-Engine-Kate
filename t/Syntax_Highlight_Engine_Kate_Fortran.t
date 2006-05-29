use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Fortran') };
my $b = new Syntax::Highlight::Engine::Kate::Fortran;
ok(defined($b));
