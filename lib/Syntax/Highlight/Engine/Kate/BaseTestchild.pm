# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'testxml/basetest2.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 0.1
#kate version 2.3
#kate author Hans Jeuken
#generated: Wed Nov  1 21:17:55 2006, localtime

package Syntax::Highlight::Engine::Kate::BaseTestchild;

use vars qw($VERSION);
$VERSION = '0.02';

use strict;
use warnings;
use base('Syntax::Highlight::Engine::Kate::Template');

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = $class->SUPER::new(@_);
	$self->attributes({
		'Match' => 'String',
		'Normal Text' => 'Normal',
	});
	$self->contextdata({
		'Base' => {
			callback => \&parseBase,
			attribute => 'Normal Text',
		},
	});
	$self->deliminators('.():!+,-<=>%&*/;?[]^{|}~\\');
	$self->basecontext('Base');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'BaseTestchild';
}

sub parseBase {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, 'it works', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::BaseTestchild - a Plugin for BaseTestchild syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::BaseTestchild;
 my $sh = new Syntax::Highlight::Engine::Kate::BaseTestchild([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::BaseTestchild is a  plugin module that provides syntax highlighting
for BaseTestchild to the Syntax::Haghlight::Engine::Kate highlighting engine.

This code is generated from the syntax definition files used
by the Kate project.
It works quite fine, but can use refinement and optimization.

It inherits Syntax::Higlight::Engine::Kate::Template. See also there.

=cut

=head1 AUTHOR

Hans Jeuken (haje <at> toneel <dot> demon <dot> nl)

=cut

=head1 BUGS

Unknown. If you find any, please contact the author

=cut

