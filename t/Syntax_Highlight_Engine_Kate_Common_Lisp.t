use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Common_Lisp') };
my $b = new Syntax::Highlight::Engine::Kate::Common_Lisp;
ok(defined($b));
