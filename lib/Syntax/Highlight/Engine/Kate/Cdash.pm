# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/cs.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.14
#kate version 2.3
#generated: Wed Nov  1 21:17:45 2006, localtime

package Syntax::Highlight::Engine::Kate::Cdash;

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
		'Function' => 'Function',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'String' => 'String',
		'String Char' => 'Char',
		'Symbol' => 'Normal',
	});
	$self->listAdd('keywords',
		'#define',
		'#elif',
		'#else',
		'#endif',
		'#error',
		'#if',
		'#line',
		'#undef',
		'#warning',
		'abstract',
		'as',
		'base',
		'break',
		'case',
		'catch',
		'checked',
		'class',
		'continue',
		'default',
		'delegate',
		'do',
		'else',
		'enum',
		'event',
		'explicit',
		'extern',
		'false',
		'finally',
		'fixed',
		'for',
		'foreach',
		'goto',
		'if',
		'implicit',
		'in',
		'interface',
		'internal',
		'is',
		'lock',
		'namespace',
		'new',
		'null',
		'operator',
		'out',
		'override',
		'params',
		'private',
		'protected',
		'public',
		'readonly',
		'ref',
		'return',
		'sealed',
		'sizeof',
		'stackalloc',
		'static',
		'struct',
		'switch',
		'this',
		'throw',
		'true',
		'try',
		'typeof',
		'unchecked',
		'unsafe',
		'using',
		'virtual',
		'while',
	);
	$self->listAdd('types',
		'bool',
		'byte',
		'char',
		'const',
		'decimal',
		'double',
		'float',
		'int',
		'long',
		'object',
		'sbyte',
		'short',
		'string',
		'uint',
		'ulong',
		'ushort',
		'void',
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
		'Member' => {
			callback => \&parseMember,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
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
	return 'C#';
}

sub parseCommentar1 {
	my ($self, $text) = @_;
	return 0;
};

sub parseCommentar2 {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseMember {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[_\\w][_\\w\\d]*(?=[\\s]*)', 0, 0, 0, undef, 0, '#pop', 'Function')) {
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
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#region.*$', 0, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#endregion.*$', 0, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[_\\w][_\\w\\d]*(?=[\\s]*[(])', 0, 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[.]{1,1}', 0, 0, 0, undef, 0, 'Member', 'Symbol')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, ':!%&()+,-/.*<=>?[]|~^;', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#pop', 'String')) {
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

Syntax::Highlight::Engine::Kate::Cdash - a Plugin for C# syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Cdash;
 my $sh = new Syntax::Highlight::Engine::Kate::Cdash([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Cdash is a  plugin module that provides syntax highlighting
for C# to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

