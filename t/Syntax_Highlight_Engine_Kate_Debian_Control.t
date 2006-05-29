use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Debian_Control') };
my $b = new Syntax::Highlight::Engine::Kate::Debian_Control;
ok(defined($b));
