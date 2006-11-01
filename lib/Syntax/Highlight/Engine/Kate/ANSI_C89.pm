# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/ansic89.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.08
#kate version 2.4
#kate author Dominik Haumann (dhdev@gmx.de)
#generated: Wed Nov  1 21:17:44 2006, localtime

package Syntax::Highlight::Engine::Kate::ANSI_C89;

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
		'continue',
		'default',
		'do',
		'else',
		'enum',
		'extern',
		'for',
		'goto',
		'if',
		'return',
		'sizeof',
		'struct',
		'switch',
		'typedef',
		'union',
		'while',
	);
	$self->listAdd('types',
		'auto',
		'char',
		'const',
		'double',
		'float',
		'int',
		'long',
		'register',
		'short',
		'signed',
		'static',
		'unsigned',
		'void',
		'volatile',
	);
	$self->contextdata({
		'Define' => {
			callback => \&parseDefine,
			attribute => 'Preprocessor',
			lineending => '#pop',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'Outscoped' => {
			callback => \&parseOutscoped,
			attribute => 'Comment',
		},
		'Outscoped intern' => {
			callback => \&parseOutscopedintern,
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
		'comment' => {
			callback => \&parsecomment,
			attribute => 'Comment',
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
	return 'ANSI C89';
}

sub parseDefine {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 1, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Symbol')) {
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
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*if\\s+0', 0, 0, 0, undef, 1, 'Outscoped', 'Preprocessor')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, ':!%&()+,-/.*<=>?[]|~^;', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	return 0;
};

sub parseOutscoped {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*if', 0, 0, 0, undef, 1, 'Outscoped intern', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*(endif|else|elif)', 0, 0, 0, undef, 1, '#pop', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseOutscopedintern {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*if', 0, 0, 0, undef, 1, 'Outscoped intern', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*endif', 0, 0, 0, undef, 1, '#pop', 'Comment')) {
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
	# type => RegExpr
	if ($self->testRegExpr($text, 'define.*((?=\\\\))', 0, 0, 0, undef, 0, 'Define', 'Preprocessor')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'define.*', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
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
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
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

sub parsecomment {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::ANSI_C89 - a Plugin for ANSI C89 syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::ANSI_C89;
 my $sh = new Syntax::Highlight::Engine::Kate::ANSI_C89([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::ANSI_C89 is a  plugin module that provides syntax highlighting
for ANSI C89 to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

