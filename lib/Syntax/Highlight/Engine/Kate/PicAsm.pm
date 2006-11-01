# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/picsrc.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.06
#kate version 2.3
#kate author Alain GIBAUD (alain.gibaud@univ-valenciennes.fr)
#generated: Wed Nov  1 21:17:51 2006, localtime

package Syntax::Highlight::Engine::Kate::PicAsm;

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
		'Based Numbers' => 'BaseN',
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Directives' => 'Others',
		'Error' => 'Error',
		'GPASM-macros' => 'BString',
		'InstructionAttr' => 'Operator',
		'Instructions' => 'Keyword',
		'Normal Text' => 'Normal',
		'Prep. Lib' => 'Others',
		'Preprocessor' => 'Others',
		'String' => 'String',
		'Symbol' => 'Variable',
		'Unbased Numbers' => 'DecVal',
	});
	$self->listAdd('conditional',
		'else',
		'endif',
		'endw',
		'idef',
		'if',
		'ifndef',
		'include',
		'while',
		'{',
		'}',
	);
	$self->listAdd('directives',
		'CBLOCK',
		'CONSTANT',
		'DA',
		'DATA',
		'DB',
		'DE',
		'DT',
		'DW',
		'END',
		'ENDC',
		'ENDM',
		'EQU',
		'ERROR',
		'ERRORLEVEL',
		'EXITM',
		'FILL',
		'LIST',
		'LOCAL',
		'MACRO',
		'MESSG',
		'NOEXPAND',
		'NOLIST',
		'ORG',
		'PAGE',
		'PROCESSOR',
		'RADIX',
		'RES',
		'SET',
		'SPACE',
		'SUBTITLE',
		'TITLE',
		'VARIABLE',
		'__BADRAM',
		'__CONFIG',
		'__IDLOCS',
		'__MAXRAM',
		'cblock',
		'constant',
		'da',
		'data',
		'db',
		'de',
		'dt',
		'dw',
		'end',
		'endc',
		'endm',
		'equ',
		'error',
		'errorlevel',
		'exitm',
		'fill',
		'list',
		'local',
		'macro',
		'messg',
		'noexpand',
		'nolist',
		'org',
		'page',
		'processor',
		'radix',
		'res',
		'set',
		'space',
		'subtitle',
		'title',
		'variable',
	);
	$self->listAdd('gpasm_macro',
		'ADDCF',
		'B',
		'CLRC',
		'CLRZ',
		'MOVFW',
		'SETC',
		'SETZ',
		'SKPC',
		'SKPNC',
		'SKPNZ',
		'SKPZ',
		'SUBCF',
		'TSTF',
		'addcf',
		'b',
		'clrc',
		'clrz',
		'movfw',
		'setc',
		'setz',
		'skpc',
		'skpnc',
		'skpnz',
		'skpz',
		'subcf',
		'tstf',
	);
	$self->listAdd('instruction_attr',
		'A',
		'ACCESS',
		'BANKED',
		'F',
		'W',
	);
	$self->listAdd('instructions',
		'ADDLW',
		'ADDWF',
		'ADDWFC',
		'ANDLW',
		'ANDWF',
		'BC',
		'BCF',
		'BN',
		'BNC',
		'BNOV',
		'BNZ',
		'BOV',
		'BRA',
		'BSF',
		'BTFSC',
		'BTFSS',
		'BTG',
		'BZ',
		'CALL',
		'CLRF',
		'CLRW',
		'CLRWDT',
		'COMF',
		'CPFSEQ',
		'CPFSGT',
		'CPFSLT',
		'DAW',
		'DCFSNZ',
		'DECF',
		'DECFSZ',
		'GOTO',
		'INCF',
		'INCFSZ',
		'INFSNZ',
		'IORLW',
		'LFSR',
		'MOVF',
		'MOVFF',
		'MOVLB',
		'MOVLW',
		'MOVWF',
		'MULLW',
		'MULWF',
		'NEGF',
		'NOP',
		'OPTION',
		'POP',
		'PUSH',
		'RCALL',
		'RESET',
		'RETFIE',
		'RETLW',
		'RETURN',
		'RLCF',
		'RLNCF',
		'RRCF',
		'RRNCF',
		'SETF',
		'SLEEP',
		'SUBFWB',
		'SUBLW',
		'SUBWF',
		'SUBWFB',
		'SWAPF',
		'TBLRD',
		'TBLWT',
		'TSTFSZ',
		'XORLW',
		'XORWF',
		'addlw',
		'addwf',
		'addwfc',
		'andlw',
		'andwf',
		'bc',
		'bcf',
		'bn',
		'bnc',
		'bnov',
		'bnz',
		'bov',
		'bra',
		'bsf',
		'btfsc',
		'btfss',
		'btg',
		'bz',
		'call',
		'clrf',
		'clrw',
		'clrwdt',
		'comf',
		'cpfseq',
		'cpfsgt',
		'cpfslt',
		'daw',
		'dcfsnz',
		'decf',
		'decfsz',
		'goto',
		'incf',
		'incfsz',
		'infsnz',
		'iorlw',
		'lfsr',
		'movf',
		'movff',
		'movlb',
		'movlw',
		'movwf',
		'mullw',
		'mulwf',
		'negf',
		'nop',
		'option',
		'pop',
		'push',
		'rcall',
		'reset',
		'retfie',
		'retlw',
		'return',
		'rlcf',
		'rlncf',
		'rrcf',
		'rrncf',
		'setf',
		'sleep',
		'subfwb',
		'sublw',
		'subwf',
		'subwfb',
		'swapf',
		'tblrd',
		'tblwt',
		'tstfsz',
		'xorlw',
		'xorwf',
	);
	$self->contextdata({
		'ASCIIChar' => {
			callback => \&parseASCIIChar,
			attribute => 'Char',
			lineending => '#pop',
		},
		'QuotedNumError' => {
			callback => \&parseQuotedNumError,
			attribute => 'Error',
			lineending => '#pop#pop',
		},
		'binaryDigits' => {
			callback => \&parsebinaryDigits,
			attribute => 'Based Numbers',
			lineending => '#pop',
		},
		'comment' => {
			callback => \&parsecomment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'decimalDigits' => {
			callback => \&parsedecimalDigits,
			attribute => 'Based Numbers',
			lineending => '#pop',
		},
		'hexDigits' => {
			callback => \&parsehexDigits,
			attribute => 'Based Numbers',
			lineending => '#pop',
		},
		'normal' => {
			callback => \&parsenormal,
			attribute => 'Normal Text',
		},
		'octDigits' => {
			callback => \&parseoctDigits,
			attribute => 'Based Numbers',
			lineending => '#pop',
		},
		'string' => {
			callback => \&parsestring,
			attribute => 'String',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'PicAsm';
}

sub parseASCIIChar {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Char')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '.[^\']', 0, 0, 0, undef, 0, 'QuotedNumError', 'Error')) {
		return 1
	}
	return 0;
};

sub parseQuotedNumError {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop#pop', 'Error')) {
		return 1
	}
	return 0;
};

sub parsebinaryDigits {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^0-1]', 0, 0, 0, undef, 0, 'QuotedNumError', 'Error')) {
		return 1
	}
	return 0;
};

sub parsecomment {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(INPUT|OUTPUT|PARAMETERS|AUTHOR|EMAIL)', 0, 0, 0, undef, 0, '#stay', 'Instructions')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parsedecimalDigits {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\D', 0, 0, 0, undef, 0, 'QuotedNumError', 'Error')) {
		return 1
	}
	return 0;
};

sub parsehexDigits {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^0-9A-Fa-f]', 0, 0, 0, undef, 0, 'QuotedNumError', 'Error')) {
		return 1
	}
	return 0;
};

sub parsenormal {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'directives', 0, 0, undef, 0, '#stay', 'Directives')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'instructions', 0, 0, undef, 0, '#stay', 'Instructions')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'instruction_attr', 0, 0, undef, 0, '#stay', 'InstructionAttr')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'conditional', 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'gpasm_macro', 0, 0, undef, 0, '#stay', 'GPASM-macros')) {
		return 1
	}
	# type => HlCHex
	if ($self->testHlCHex($text, 0, undef, 0, '#stay', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([ \\t,][0-9A-F]+H[ \\t,])', 1, 0, 0, undef, 0, '#stay', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([ \\t,][0-9A-F]+H)$', 1, 0, 0, undef, 0, '#stay', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([ \\t,][0-9]+D)', 1, 0, 0, undef, 0, '#stay', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([ \\t,][0-7]+O)', 1, 0, 0, undef, 0, '#stay', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([ \\t,][0-1]+B)', 1, 0, 0, undef, 0, '#stay', 'Based Numbers')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, '#stay', 'Non Based Numbers')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'A', '\'', 0, 0, 0, undef, 0, 'ASCIIChar', 'Char')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'a', '\'', 0, 0, 0, undef, 0, 'ASCIIChar', 'Char')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'B', '\'', 0, 0, 0, undef, 0, 'binaryDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'b', '\'', 0, 0, 0, undef, 0, 'binaryDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'H', '\'', 0, 0, 0, undef, 0, 'hexDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'h', '\'', 0, 0, 0, undef, 0, 'hexDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'O', '\'', 0, 0, 0, undef, 0, 'octDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'o', '\'', 0, 0, 0, undef, 0, 'octDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'D', '\'', 0, 0, 0, undef, 0, 'decimalDigits', 'Based Numbers')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'd', '\'', 0, 0, 0, undef, 0, 'decimalDigits', 'Based Numbers')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'string', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '-/*%+=><&|^!~', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#define', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#undefine', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#v', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parseoctDigits {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Based Numbers')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^0-7]', 0, 0, 0, undef, 0, 'QuotedNumError', 'Error')) {
		return 1
	}
	return 0;
};

sub parsestring {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => HlCStringChar
	if ($self->testHlCStringChar($text, 0, undef, 0, '#stay', 'Char')) {
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

Syntax::Highlight::Engine::Kate::PicAsm - a Plugin for PicAsm syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::PicAsm;
 my $sh = new Syntax::Highlight::Engine::Kate::PicAsm([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::PicAsm is a  plugin module that provides syntax highlighting
for PicAsm to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

