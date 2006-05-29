use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::GDL') };
my $b = new Syntax::Highlight::Engine::Kate::GDL;
ok(defined($b));
