# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/ferite.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.04
#kate version 2.4
#generated: Wed Nov  1 21:17:46 2006, localtime

package Syntax::Highlight::Engine::Kate::Ferite;

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
		'break',
		'case',
		'class',
		'continue',
		'do',
		'else',
		'fix',
		'for',
		'function',
		'global',
		'if',
		'iferr',
		'namespace',
		'new',
		'null',
		'return',
		'self',
		'super',
		'uses',
		'while',
	);
	$self->listAdd('types',
		'array',
		'final',
		'number',
		'object',
		'static',
		'string',
		'void',
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
		'Multiline Comment' => {
			callback => \&parseMultilineComment,
			attribute => 'Comment',
		},
		'Multiline Comment 2' => {
			callback => \&parseMultilineComment2,
			attribute => 'Comment',
		},
		'Preprocessor' => {
			callback => \&parsePreprocessor,
			attribute => 'Preprocessor',
			lineending => '#pop',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
			lineending => '#pop',
		},
		'Undeffed' => {
			callback => \&parseUndeffed,
			attribute => 'Comment',
		},
		'unknown' => {
			callback => \&parseunknown,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'unknown 2' => {
			callback => \&parseunknown2,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Default');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'ferite';
}

sub parseComment {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseDefault {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, undef, 0, '#stay', 'Float')) {
		# type => AnyChar
		if ($self->testAnyChar($text, 'fF', 0, 0, undef, 0, '#stay', 'Float')) {
			return 1
		}
	}
	# type => HlCOct
	if ($self->testHlCOct($text, 0, undef, 0, '#stay', 'Octal')) {
		return 1
	}
	# type => HlCHex
	if ($self->testHlCHex($text, 0, undef, 0, '#stay', 'Hex')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, '#stay', 'Decimal')) {
		# type => StringDetect
		if ($self->testStringDetect($text, 'ULL', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'LUL', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'LLU', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'UL', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'LU', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'LL', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'U', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
		# type => StringDetect
		if ($self->testStringDetect($text, 'L', 1, 0, 0, undef, 0, '#stay', 'Decimal')) {
			return 1
		}
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Multiline Comment', 'Comment')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '!%&()+,-<=>?[]^{|}~', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#if 0', 0, 0, 0, undef, 0, 'Undeffed', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, 0, 0, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseMultilineComment {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseMultilineComment2 {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsePreprocessor {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'Preprocessor')) {
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
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Multiline Comment 2', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'String')) {
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

sub parseUndeffed {
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

sub parseunknown {
	my ($self, $text) = @_;
	return 0;
};

sub parseunknown2 {
	my ($self, $text) = @_;
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Ferite - a Plugin for ferite syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Ferite;
 my $sh = new Syntax::Highlight::Engine::Kate::Ferite([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Ferite is a  plugin module that provides syntax highlighting
for ferite to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

