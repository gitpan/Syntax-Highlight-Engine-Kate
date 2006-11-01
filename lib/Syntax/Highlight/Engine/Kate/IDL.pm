# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/idl.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.07
#kate version 2.4
#generated: Wed Nov  1 21:17:48 2006, localtime

package Syntax::Highlight::Engine::Kate::IDL;

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
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Data Type' => 'DataType',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Prep. Lib' => 'Others',
		'Preprocessor' => 'Others',
		'String' => 'String',
		'String Char' => 'Char',
		'Symbol' => 'Normal',
	});
	$self->listAdd('keywords',
		'FALSE',
		'Object',
		'TRUE',
		'any',
		'attribute',
		'case',
		'const',
		'context',
		'default',
		'enum',
		'exception',
		'fixed',
		'in',
		'inout',
		'interface',
		'module',
		'oneway',
		'out',
		'public',
		'raises',
		'readonly',
		'sequence',
		'struct',
		'switch',
		'typedef',
		'union',
		'unsigned',
	);
	$self->listAdd('types',
		'boolean',
		'char',
		'double',
		'float',
		'long',
		'octet',
		'short',
		'string',
		'void',
		'wchar',
		'wstring',
	);
	$self->contextdata({
		'Commentar 1' => {
			callback => \&parseCommentar1,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Commentar 2' => {
			callback => \&parseCommentar2,
			attribute => 'Comment',
		},
		'Commentar/Preprocessor' => {
			callback => \&parseCommentarPreprocessor,
			attribute => 'Comment',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'Preprocessor' => {
			callback => \&parsePreprocessor,
			attribute => 'Preprocessor',
			lineending => '#pop',
		},
		'Some Context' => {
			callback => \&parseSomeContext,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'Some Context2' => {
			callback => \&parseSomeContext2,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'Some Context3' => {
			callback => \&parseSomeContext3,
			attribute => 'Normal Text',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
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
	return 'IDL';
}

sub parseCommentar1 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseCommentar2 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseCommentarPreprocessor {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => HlCOct
	if ($self->testHlCOct($text, 0, undef, 0, '#stay', 'Octal')) {
		return 1
	}
	# type => HlCHex
	if ($self->testHlCHex($text, 0, undef, 0, '#stay', 'Hex')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('Doxygen', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Commentar 1', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Commentar 2', 'Comment')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '!%&()+,-<=>?[]^{|}~', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#if 0', 0, 0, 0, undef, 0, 'Some Context3', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, 0, 0, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parsePreprocessor {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, 'Some Context2', 'Preprocessor')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '"', '"', 0, 0, undef, 0, '#stay', 'Prep. Lib')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '<', '>', 0, 0, undef, 0, '#stay', 'Prep. Lib')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Commentar 1', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Commentar/Preprocessor', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseSomeContext {
	my ($self, $text) = @_;
	return 0;
};

sub parseSomeContext2 {
	my ($self, $text) = @_;
	return 0;
};

sub parseSomeContext3 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#endif', 0, 0, 0, 0, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, 'Some Context', 'String')) {
		return 1
	}
	# type => HlCStringChar
	if ($self->testHlCStringChar($text, 0, undef, 0, '#stay', 'String Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::IDL - a Plugin for IDL syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::IDL;
 my $sh = new Syntax::Highlight::Engine::Kate::IDL([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::IDL is a  plugin module that provides syntax highlighting
for IDL to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

