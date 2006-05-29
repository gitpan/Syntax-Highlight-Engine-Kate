use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::ChangeLog') };
my $b = new Syntax::Highlight::Engine::Kate::ChangeLog;
ok(defined($b));
