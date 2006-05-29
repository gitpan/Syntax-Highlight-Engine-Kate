use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::RPM_Spec') };
my $b = new Syntax::Highlight::Engine::Kate::RPM_Spec;
ok(defined($b));
