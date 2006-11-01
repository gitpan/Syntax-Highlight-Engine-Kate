# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/pascal.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.20
#kate version 2.3
#generated: Wed Nov  1 21:17:50 2006, localtime

package Syntax::Highlight::Engine::Kate::Pascal;

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
		'Alert' => 'Alert',
		'Comment' => 'Comment',
		'Directive' => 'Others',
		'ISO/Delphi Extended' => 'Function',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Number' => 'DecVal',
		'String' => 'String',
		'Type' => 'DataType',
	});
	$self->listAdd('ISO/Delphi Extended',
		'as',
		'bindable',
		'constructor',
		'destructor',
		'except',
		'export',
		'finally',
		'implementation',
		'import',
		'inherited',
		'inline',
		'interface',
		'is',
		'module',
		'on',
		'only',
		'otherwise',
		'private',
		'property',
		'protected',
		'public',
		'qualified',
		'raise',
		'restricted',
		'shl',
		'shr',
		'threadvar',
		'try',
	);
	$self->listAdd('attention',
		'###',
		'FIXME',
		'TODO',
	);
	$self->listAdd('keywords',
		'and',
		'array',
		'asm',
		'at',
		'automated',
		'break',
		'case',
		'const',
		'continue',
		'dispinterface',
		'dispose',
		'div',
		'do',
		'downto',
		'else',
		'exit',
		'false',
		'file',
		'finalization',
		'for',
		'function',
		'goto',
		'if',
		'in',
		'initialization',
		'label',
		'library',
		'mod',
		'new',
		'nil',
		'not',
		'of',
		'operator',
		'or',
		'packed',
		'procedure',
		'program',
		'published',
		'record',
		'repeat',
		'resourcestring',
		'self',
		'set',
		'then',
		'to',
		'true',
		'type',
		'unit',
		'until',
		'uses',
		'var',
		'while',
		'with',
		'xor',
	);
	$self->listAdd('types',
		'AnsiChar',
		'AnsiString',
		'Boolean',
		'Byte',
		'ByteBool',
		'Cardinal',
		'Char',
		'Comp',
		'Currency',
		'Double',
		'Extended',
		'File',
		'Int64',
		'Integer',
		'LongBool',
		'LongInt',
		'LongWord',
		'Pointer',
		'Real',
		'Real48',
		'ShortInt',
		'ShortString',
		'Single',
		'SmallInt',
		'String',
		'Text',
		'Variant',
		'WideChar',
		'WideString',
		'Word',
		'WordBool',
	);
	$self->contextdata({
		'Comment1' => {
			callback => \&parseComment1,
			attribute => 'Comment',
		},
		'Comment2' => {
			callback => \&parseComment2,
			attribute => 'Comment',
		},
		'Comment3' => {
			callback => \&parseComment3,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'Prep1' => {
			callback => \&parsePrep1,
			attribute => 'Directive',
			lineending => '#pop',
		},
		'Prep2' => {
			callback => \&parsePrep2,
			attribute => 'Directive',
			lineending => '#pop',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Pascal';
}

sub parseComment1 {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'attention', 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseComment2 {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'attention', 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', ')', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseComment3 {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'attention', 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b(begin|case|record)(?=(\\{[^}]*(\\}|$)|\\(\\*.*(\\*\\)|$))*([\\s]|$|//))', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b((object|class)(?=(\\(.*\\))?(\\{[^}]*(\\}|$)|\\(\\*.*(\\*\\)|$))*([\\s]|$|//))|try(?=(\\{[^}]*(\\}|$)|\\(\\*.*(\\*\\)|$))*([\\s]|$|//)))', 1, 0, 0, undef, 0, '#stay', 'ISO/Delphi Extended')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend(?=((\\{[^}]*(\\}|$)|\\(\\*.*(\\*\\)|$))*)([.;\\s]|$)|//|$)', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'ISO/Delphi Extended', 0, 0, undef, 0, '#stay', 'ISO/Delphi Extended')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Type')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '(*$', 0, 0, 0, undef, 0, 'Prep1', 'Directive')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '{', '$', 0, 0, 0, undef, 0, 'Prep2', 'Directive')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'Comment1', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '(', '*', 0, 0, 0, undef, 0, 'Comment2', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Comment3', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsePrep1 {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', ')', 0, 0, 0, undef, 0, '#pop', 'Directive')) {
		return 1
	}
	return 0;
};

sub parsePrep2 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Directive')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Pascal - a Plugin for Pascal syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Pascal;
 my $sh = new Syntax::Highlight::Engine::Kate::Pascal([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Pascal is a  plugin module that provides syntax highlighting
for Pascal to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

