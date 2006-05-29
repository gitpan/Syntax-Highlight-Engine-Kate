use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::FourGLminusPER') };
my $b = new Syntax::Highlight::Engine::Kate::FourGLminusPER;
ok(defined($b));
