use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::ANSI_C89') };
my $b = new Syntax::Highlight::Engine::Kate::ANSI_C89;
ok(defined($b));
