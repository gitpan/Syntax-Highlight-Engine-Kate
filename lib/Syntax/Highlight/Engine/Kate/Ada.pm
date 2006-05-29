# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/ada.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.05
#kate version 2.4
#generated: Sun May 28 21:18:21 2006, localtime

package Syntax::Highlight::Engine::Kate::Ada;

use vars qw($VERSION);
$VERSION = '0.01';

use strict;
use warnings;
use base('Syntax::Highlight::Engine::Kate::Template');

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = $class->SUPER::new(@_);
	$self->attributes({
		'Base-N' => 'BaseN',
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'String' => 'String',
	});
	$self->listAdd('keywords',
		'abort',
		'abs',
		'abstract',
		'accept',
		'access',
		'aliased',
		'all',
		'and',
		'array',
		'at',
		'begin',
		'body',
		'constant',
		'declare',
		'delay',
		'delta',
		'digits',
		'do',
		'else',
		'elsif',
		'end',
		'entry',
		'exception',
		'exit',
		'for',
		'function',
		'generic',
		'goto',
		'in',
		'is',
		'limited',
		'mod',
		'new',
		'not',
		'null',
		'of',
		'or',
		'others',
		'out',
		'package',
		'pragma',
		'private',
		'procedure',
		'protected',
		'raise',
		'range',
		'record',
		'rem',
		'renames',
		'requeue',
		'return',
		'reverse',
		'separate',
		'subtype',
		'tagged',
		'task',
		'terminate',
		'then',
		'type',
		'until',
		'use',
		'when',
		'while',
		'with',
		'xor',
	);
	$self->contextdata({
		'Comment' => {
			callback => \&parseComment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Default' => {
			callback => \&parseDefault,
			attribute => 'Normal Text',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Default');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Ada';
}

sub parseComment {
	my ($self, $text) = @_;
	return 0;
};

sub parseDefault {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, 'if ', 1, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'end if', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'case ', 1, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'end case', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\sloop\\s+', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\sloop$', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'end loop;', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\sselect\\s+', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\sselect$', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'end select;', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\'.\'', 0, 0, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '-', '-', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
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

Syntax::Highlight::Engine::Kate::Ada - a Plugin for Ada syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Ada;
 my $sh = new Syntax::Highlight::Engine::Kate::Ada([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Ada is a  plugin module that provides syntax highlighting
for Ada to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

