use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::PicAsm') };
my $b = new Syntax::Highlight::Engine::Kate::PicAsm;
ok(defined($b));
