use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Perl') };
my $b = new Syntax::Highlight::Engine::Kate::Perl;
ok(defined($b));
