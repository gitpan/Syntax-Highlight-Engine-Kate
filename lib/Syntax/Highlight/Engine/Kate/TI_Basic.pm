# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/tibasic.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.01
#kate version 2.3
#generated: Wed Nov  1 21:17:54 2006, localtime

package Syntax::Highlight::Engine::Kate::TI_Basic;

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
		'Assignment' => 'Others',
		'Keyword' => 'Keyword',
		'Matrix' => 'Normal',
		'Normal Text' => 'Normal',
		'Special operators' => 'Normal',
		'String' => 'String',
	});
	$self->listAdd('keywords',
		'ClrHome',
		'ClrTable',
		'DS<',
		'DelVar',
		'Disp',
		'DispGraph',
		'DispTable',
		'Else',
		'End',
		'For',
		'Get',
		'GetCalc',
		'Goto',
		'GraphStyle',
		'IS>',
		'If',
		'Input',
		'Lbl',
		'Menu',
		'Output',
		'Pause',
		'Prompt',
		'Repeat',
		'Return',
		'Send',
		'Then',
		'While',
		'getKey',
		'prgm',
		'prgm',
	);
	$self->listAdd('special_sym',
		'%THETA',
		'eogt',
		'eolt',
		'net',
		'sqrt',
	);
	$self->contextdata({
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|=|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'TI Basic';
}

sub parseNormal {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'special_sym', 0, 0, undef, 0, '#stay', 'Special operators')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '-', '>', 0, 0, 0, undef, 0, '#stay', 'Assignment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 's', 't', 0, 0, 0, undef, 0, '#stay', 'Assignment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[\\w\\]', 0, 0, 0, undef, 0, '#stay', 'Matrix')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::TI_Basic - a Plugin for TI Basic syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::TI_Basic;
 my $sh = new Syntax::Highlight::Engine::Kate::TI_Basic([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::TI_Basic is a  plugin module that provides syntax highlighting
for TI Basic to the Syntax::Haghlight::Engine::Kate highlighting engine.

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
