use Test::More tests => 2;
BEGIN { use_ok('Syntax::Highlight::Engine::Kate::Music_Publisher') };
my $b = new Syntax::Highlight::Engine::Kate::Music_Publisher;
ok(defined($b));
