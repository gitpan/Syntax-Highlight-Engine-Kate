# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/asp.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.00
#kate version 2.1
#kate author Antonio Salazar (savedfastcool@gmail.com)
#generated: Sun May 28 21:18:23 2006, localtime

package Syntax::Highlight::Engine::Kate::ASP;

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
		'ASP Text' => 'Normal',
		'Comment' => 'Comment',
		'Control Structures' => 'Operator',
		'Decimal' => 'DecVal',
		'Escape Code' => 'Char',
		'Float' => 'Float',
		'Function' => 'Function',
		'HTML Comment' => 'Comment',
		'HTML Tag' => 'BString',
		'Hex' => 'BaseN',
		'Identifier' => 'Others',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Other' => 'Others',
		'String' => 'String',
		'Types' => 'DataType',
		'Variable' => 'Variable',
	});
	$self->listAdd('control structures',
		'case',
		'continue',
		'do',
		'each',
		'else',
		'elseif',
		'end if',
		'end select',
		'exit',
		'for',
		'if',
		'in',
		'loop',
		'next',
		'select',
		'then',
		'to',
		'until',
		'while',
	);
	$self->listAdd('functions',
		'cookies',
		'createobject',
		'end',
		'form',
		'instr',
		'lbound',
		'lcase',
		'left',
		'mid',
		'querystring',
		'redirect',
		'request',
		'response',
		'right',
		'server',
		'servervariables',
		'session',
		'split',
		'ubound',
		'ucase',
		'write',
	);
	$self->listAdd('keywords',
		'call',
		'class',
		'close',
		'dim',
		'eof',
		'execute',
		'false',
		'function',
		'movenext',
		'new',
		'not',
		'open',
		'preserve',
		'redim',
		'sub',
		'true',
	);
	$self->contextdata({
		'asp_onelinecomment' => {
			callback => \&parseasp_onelinecomment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'aspsource' => {
			callback => \&parseaspsource,
			attribute => 'ASP Text',
		},
		'doblequotestring' => {
			callback => \&parsedoblequotestring,
			attribute => 'String',
		},
		'htmlcomment' => {
			callback => \&parsehtmlcomment,
			attribute => 'HTML Comment',
		},
		'htmltag' => {
			callback => \&parsehtmltag,
			attribute => 'Identifier',
		},
		'identifiers' => {
			callback => \&parseidentifiers,
			attribute => 'Identifier',
		},
		'nosource' => {
			callback => \&parsenosource,
			attribute => 'Normal Text',
		},
		'scripts' => {
			callback => \&parsescripts,
			attribute => 'Normal Text',
		},
		'scripts_onelinecomment' => {
			callback => \&parsescripts_onelinecomment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'singlequotestring' => {
			callback => \&parsesinglequotestring,
			attribute => 'String',
		},
		'twolinecomment' => {
			callback => \&parsetwolinecomment,
			attribute => 'Comment',
		},
		'types1' => {
			callback => \&parsetypes1,
			attribute => 'Types',
		},
		'types2' => {
			callback => \&parsetypes2,
			attribute => 'Types',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('nosource');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'ASP';
}

sub parseasp_onelinecomment {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '%>', 0, 0, 0, undef, 0, '#pop#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseaspsource {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '%>', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'asp_onelinecomment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'doblequotestring', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'singlequotestring', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '&', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '', 0, 0, 0, undef, 0, '', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[0123456789]*\\.\\.\\.[0123456789]*', 0, 0, 0, undef, 0, '#stay', 'String')) {
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
	# type => Float
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, ';()}{:,[]', 0, 0, undef, 0, '#stay', 'Other')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'Others', 0, 0, undef, 0, '#stay', 'Other')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\belseif\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\belse\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bif\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend if\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfunction\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend function\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bsub\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend sub\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bexit do\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdo\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bloop\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfor\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bnext\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfor each\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bnext\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bselect case\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend select\\b', 1, 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'control structures', 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'functions', 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	return 0;
};

sub parsedoblequotestring {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '"', '"', 0, 0, 0, undef, 0, '#stay', 'Escape Code')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[0-7]{1,3}', 0, 0, 0, undef, 0, '#stay', 'Escape Code')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\x[0-9A-Fa-f]{1,2}', 0, 0, 0, undef, 0, '#stay', 'Escape Code')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsehtmlcomment {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '-->', 0, 0, 0, undef, 0, '#pop', 'HTML Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*=\\s*', 0, 0, 0, undef, 0, 'identifiers', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsehtmltag {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '>', 0, 0, 0, undef, 0, '#pop', 'HTML Tag')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'HTML Tag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*=\\s*', 0, 0, 0, undef, 0, 'identifiers', 'Identifier')) {
		return 1
	}
	return 0;
};

sub parseidentifiers {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*#?[a-zA-Z0-9]*', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'types1', 'Types')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'types2', 'Types')) {
		return 1
	}
	return 0;
};

sub parsenosource {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<\\s*script(\\s|>)', 1, 0, 0, undef, 0, 'scripts', 'HTML Tag')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<\\s*\\/?\\s*[a-zA-Z_:][a-zA-Z0-9._:-]*', 0, 0, 0, undef, 0, 'htmltag', 'HTML Tag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<!--', 0, 0, 0, undef, 0, 'htmlcomment', 'HTML Comment')) {
		return 1
	}
	return 0;
};

sub parsescripts {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'scripts_onelinecomment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'twolinecomment', 'Comment')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'control structures', 0, 0, undef, 0, '#stay', 'Control Structures')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'functions', 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<\\s*\\/\\s*script\\s*>', 1, 0, 0, undef, 0, '#pop', 'HTML Tag')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'doblequotestring', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'singlequotestring', 'String')) {
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
	# type => Float
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
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
	# type => AnyChar
	if ($self->testAnyChar($text, ';()}{:,[]', 0, 0, undef, 0, '#stay', 'Other')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'Others', 0, 0, undef, 0, '#stay', 'Other')) {
		return 1
	}
	return 0;
};

sub parsescripts_onelinecomment {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '<\\s*\\/\\s*script\\s*>', 1, 0, 0, undef, 0, '#pop#pop', 'HTML Tag')) {
		return 1
	}
	return 0;
};

sub parsesinglequotestring {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\'', '\'', 0, 0, 0, undef, 0, '#stay', 'Escape Code')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsetwolinecomment {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsetypes1 {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop#pop', 'Types')) {
		return 1
	}
	return 0;
};

sub parsetypes2 {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<%', 0, 0, 0, undef, 0, 'aspsource', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop#pop', 'Types')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::ASP - a Plugin for ASP syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::ASP;
 my $sh = new Syntax::Highlight::Engine::Kate::ASP([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::ASP is a  plugin module that provides syntax highlighting
for ASP to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

