# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/asm-avr.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.03
#kate version 2.4
#kate author Roland Nagy
#generated: Sun May 28 21:18:22 2006, localtime

package Syntax::Highlight::Engine::Kate::AVR_Assembler;

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
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Label' => 'Function',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Preprocessor' => 'Others',
		'String' => 'String',
		'String Char' => 'Char',
		'Symbol' => 'Normal',
	});
	$self->listAdd('keywords',
		'adc',
		'add',
		'adiw',
		'and',
		'andi',
		'asr',
		'bclr',
		'bld',
		'brbc',
		'brbs',
		'break',
		'breq',
		'brge',
		'brhc',
		'brhs',
		'brid',
		'brie',
		'brlo',
		'brlt',
		'brmi',
		'brne',
		'brpl',
		'brsh',
		'brtc',
		'brts',
		'brvc',
		'brvs',
		'bset',
		'bst',
		'call',
		'cbi',
		'cbr',
		'clc',
		'clh',
		'cli',
		'cln',
		'clr',
		'cls',
		'clt',
		'clv',
		'clz',
		'com',
		'cp',
		'cpc',
		'cpi',
		'cpse',
		'dec',
		'eicall',
		'eijmp',
		'elpm',
		'eor',
		'fmul',
		'fmuls',
		'fmulsu',
		'icall',
		'ijmp',
		'in',
		'inc',
		'jmp',
		'ld',
		'ldi',
		'lds',
		'lpm',
		'lsl',
		'lsr',
		'mov',
		'movw',
		'mul',
		'muls',
		'mulsu',
		'neg',
		'nop',
		'or',
		'ori',
		'out',
		'pop',
		'push',
		'rcall',
		'ret',
		'reti',
		'rjmp',
		'rol',
		'ror',
		'sbc',
		'sbci',
		'sbi',
		'sbic',
		'sbis',
		'sbiw',
		'sbr',
		'sbrc',
		'sbrs',
		'sec',
		'seh',
		'sei',
		'sen',
		'ser',
		'ses',
		'set',
		'sev',
		'sez',
		'sleep',
		'spm',
		'st',
		'sts',
		'sub',
		'subi',
		'swap',
		'tst',
		'wdr',
	);
	$self->contextdata({
		'Commentar 1' => {
			callback => \&parseCommentar1,
			attribute => 'Comment',
		},
		'Commentar 2' => {
			callback => \&parseCommentar2,
			attribute => 'Comment',
			lineending => '#pop',
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
		'String' => {
			callback => \&parseString,
			attribute => 'String',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'AVR Assembler';
}

sub parseCommentar1 {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseCommentar2 {
	my ($self, $text) = @_;
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[A-Za-z0-9_.$]+:', 0, 0, 0, undef, 1, '#stay', 'Label')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
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
	# type => RegExpr
	if ($self->testRegExpr($text, '0[bB][01]+', 0, 0, 0, undef, 0, '#stay', 'Binary')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '0[fFeEdD][-+]?[0-9]*\\.?[0-9]*[eE]?[-+]?[0-9]+', 0, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[A-Za-z_.$][A-Za-z0-9_.$]*', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\'(\\\\x[0-9a-fA-F][0-9a-fA-F]?|\\\\[0-7]?[0-7]?[0-7]?|\\\\.|.)', 0, 0, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Commentar 1', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '@', 0, 0, 0, undef, 0, 'Commentar 2', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, 'Commentar 2', 'Comment')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '!#%&*()+,-<=>?/:[]^{|}~', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '^#', 0, 0, 0, undef, 0, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	return 0;
};

sub parsePreprocessor {
	my ($self, $text) = @_;
	return 0;
};

sub parseSomeContext {
	my ($self, $text) = @_;
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

Syntax::Highlight::Engine::Kate::AVR_Assembler - a Plugin for AVR Assembler syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::AVR_Assembler;
 my $sh = new Syntax::Highlight::Engine::Kate::AVR_Assembler([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::AVR_Assembler is a  plugin module that provides syntax highlighting
for AVR Assembler to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

