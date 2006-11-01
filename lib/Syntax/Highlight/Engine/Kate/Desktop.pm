# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/desktop.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.04
#kate version 2.4
#generated: Wed Nov  1 21:17:46 2006, localtime

package Syntax::Highlight::Engine::Kate::Desktop;

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
		'Comment' => 'Comment',
		'Key' => 'DataType',
		'Language' => 'DecVal',
		'Normal Text' => 'Normal',
		'Section' => 'Keyword',
	});
	$self->contextdata({
		'Comment' => {
			callback => \&parseComment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Key',
		},
		'Value' => {
			callback => \&parseValue,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
	});
	$self->deliminators('.():!+,-<=>%&*/;?[]^{|}~\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return '.desktop';
}

sub parseComment {
	my ($self, $text) = @_;
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[.*\\]$', 0, 0, 0, 0, 0, '#stay', 'Section')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[.*\\]', 0, 0, 0, undef, 0, 'Value', 'Language')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 1, 'Comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '=', 0, 0, 0, undef, 0, 'Value', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseValue {
	my ($self, $text) = @_;
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Desktop - a Plugin for .desktop syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Desktop;
 my $sh = new Syntax::Highlight::Engine::Kate::Desktop([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Desktop is a  plugin module that provides syntax highlighting
for .desktop to the Syntax::Haghlight::Engine::Kate highlighting engine.

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
