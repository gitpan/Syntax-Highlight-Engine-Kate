# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/pike.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.07
#kate version 2.4
#kate author Paul Pogonyshev
#generated: Sun May 28 21:18:41 2006, localtime

package Syntax::Highlight::Engine::Kate::Pike;

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
		'Binary' => 'BaseN',
		'Builtin Function' => 'Function',
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Data Type' => 'DataType',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Note' => 'Alert',
		'Octal' => 'BaseN',
		'Preprocessor' => 'Others',
		'Preprocessor Lib' => 'String',
		'String' => 'String',
		'String Char' => 'Char',
	});
	$self->listAdd('builtins',
		'catch',
		'gauge',
		'sscanf',
		'typeof',
	);
	$self->listAdd('keywords',
		'break',
		'case',
		'class',
		'continue',
		'default',
		'do',
		'else',
		'for',
		'foreach',
		'if',
		'return',
		'switch',
		'while',
	);
	$self->listAdd('types',
		'array',
		'float',
		'function',
		'int',
		'mapping',
		'mixed',
		'multiset>',
		'object',
		'program',
		'static',
		'string',
		'void',
	);
	$self->contextdata({
		'Block Comment' => {
			callback => \&parseBlockComment,
			attribute => 'Comment',
		},
		'Line Comment' => {
			callback => \&parseLineComment,
			attribute => 'Comment',
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
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Pike';
}

sub parseBlockComment {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO|NOT(IC)?E):?', 0, 0, 0, undef, 0, '#stay', 'Note')) {
		return 1
	}
	return 0;
};

sub parseLineComment {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO|NOT(IC)?E):?', 0, 0, 0, undef, 0, '#stay', 'Note')) {
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
	# type => keyword
	if ($self->testKeyword($text, 'builtins', 0, 0, undef, 0, '#stay', 'Builtin Function')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '`([\\+\\-\\*/%~&\\|^]|[!=<>]=|<<?|>>?|(\\[\\]|->)=?)', 0, 0, 0, undef, 0, '#stay', 'Builtin Function')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '0[bB][01]+', 0, 0, 0, undef, 0, '#stay', 'Binary')) {
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
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Line Comment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '!', 0, 0, 0, undef, 0, 'Line Comment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Block Comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*if\\s+0', 0, 0, 0, undef, 1, 'Outscoped', 'Preprocessor')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 1, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseOutscoped {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO|NOT(IC)?E):?', 0, 0, 0, undef, 0, '#stay', 'Note')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Block Comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*if', 0, 0, 0, undef, 1, 'Outscoped intern', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*(endif|elif|else)', 0, 0, 0, undef, 1, '#pop', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseOutscopedintern {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Block Comment', 'Comment')) {
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
	# type => RangeDetect
	if ($self->testRangeDetect($text, '"', '"', 0, 0, undef, 0, '#stay', 'Preprocessor Lib')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '<', '>', 0, 0, undef, 0, '#stay', 'Preprocessor Lib')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Line Comment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Block Comment', 'Comment')) {
		return 1
	}
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\d[0-9]+', 0, 0, 0, undef, 0, '#stay', 'String Char')) {
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
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Pike - a Plugin for Pike syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Pike;
 my $sh = new Syntax::Highlight::Engine::Kate::Pike([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Pike is a  plugin module that provides syntax highlighting
for Pike to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

