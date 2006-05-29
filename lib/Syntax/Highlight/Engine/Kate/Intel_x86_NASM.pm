# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/nasm.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.01
#kate version 2.3
#kate author Nicola Gigante (nicola.gigante@gmail.com)
#generated: Sun May 28 21:18:38 2006, localtime

package Syntax::Highlight::Engine::Kate::Intel_x86_NASM;

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
		'BaseN' => 'BaseN',
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Data' => 'DataType',
		'Float' => 'Float',
		'Instructions' => 'Keyword',
		'Label' => 'Function',
		'NASM Keywords' => 'Keyword',
		'Normal Text' => 'Normal',
		'Number' => 'DecVal',
		'Preprocessor' => 'Others',
		'Registers' => 'Keyword',
		'String' => 'String',
	});
	$self->listAdd('Data',
		'byte',
		'db',
		'dd',
		'dq',
		'dt',
		'dw',
		'dword',
		'equ',
		'incbin',
		'ptr',
		'qword',
		'resb',
		'resd',
		'resq',
		'rest',
		'resw',
		'short',
		'times',
		'word',
	);
	$self->listAdd('NASM Keywords',
		'__FILE__',
		'__LINE__',
		'__NASM_MAJOR__',
		'__NASM_MINOR__',
		'__NASM_SUBMINOR__',
		'__NASM_VERSION_ID__',
		'__NASM_VER__',
		'___NASM_PATCHLEVEL__',
		'__sect__',
		'absolute',
		'align',
		'alignb',
		'at',
		'bits',
		'common',
		'endstruc',
		'extern',
		'global',
		'iend',
		'istruc',
		'org',
		'section',
		'seg',
		'segment',
		'strict',
		'struc',
		'use16',
		'use32',
		'wrt',
	);
	$self->listAdd('instructions',
		'aaa',
		'aad',
		'aam',
		'aas',
		'adc',
		'add',
		'addpd',
		'addps',
		'addsd',
		'addss',
		'and',
		'andnpd',
		'andnps',
		'andpd',
		'andps',
		'arpl',
		'bound',
		'bsf',
		'bsr',
		'bswap',
		'bt',
		'btc',
		'btr',
		'bts',
		'call',
		'cdq',
		'cdq',
		'clc',
		'cld',
		'clflush',
		'cli',
		'clts',
		'cmc',
		'cmp',
		'cmppd',
		'cmpps',
		'cmpsd',
		'cmpsd',
		'cmpss',
		'cmpxchg',
		'comisd',
		'comiss',
		'cpuid',
		'cwd',
		'cwde',
		'cwde',
		'daa',
		'das',
		'dec',
		'div',
		'divpd',
		'divps',
		'divsd',
		'divss',
		'emms',
		'enter',
		'fabs',
		'fbld',
		'fbstp',
		'fchs',
		'fcompp',
		'fcos',
		'fdecstp',
		'ffree',
		'fiadd',
		'ficomp',
		'fidiv',
		'fidivr',
		'fild',
		'fimul',
		'fincstp',
		'fistp',
		'fisub',
		'fisubr',
		'fld',
		'fldcw',
		'fldenv',
		'fldz',
		'fnclex',
		'fninit',
		'fnop',
		'fnsave',
		'fnstcw',
		'fnstenv',
		'fnstsw',
		'fpatan',
		'fprem',
		'fptan',
		'frndint',
		'frstor',
		'fscale',
		'fsin',
		'fsincos',
		'fsqrt',
		'fstp',
		'ftst',
		'fucomip',
		'fucompp',
		'fwait',
		'fwait',
		'fxam',
		'fxch',
		'fxrstor',
		'fxsave',
		'fxtract',
		'hlt',
		'idiv',
		'imul',
		'in',
		'inc',
		'insd',
		'int',
		'into',
		'invd',
		'invlpg',
		'iret',
		'iretd',
		'jmp',
		'lahf',
		'lar',
		'ldmxcsr',
		'lea',
		'leave',
		'les',
		'lfence',
		'lfs',
		'lidt',
		'lidt',
		'lldt',
		'lmsw',
		'lock',
		'lodsb',
		'lodsd',
		'lsl',
		'lss',
		'lss',
		'ltr',
		'maskmovdqu',
		'maskmovq',
		'maxpd',
		'maxps',
		'maxsd',
		'maxss',
		'mfence',
		'minpd',
		'minps',
		'minsd',
		'minss',
		'mov',
		'mov',
		'mov',
		'movapd',
		'movaps',
		'movd',
		'movdqa',
		'movdqu',
		'movhlps',
		'movhpd',
		'movhps',
		'movlhps',
		'movlpd',
		'movlps',
		'movmskpd',
		'movmskps',
		'movntdq',
		'movnti',
		'movntpd',
		'movntps',
		'movntq',
		'movq',
		'movsd',
		'movsd',
		'movss',
		'movsx',
		'movupd',
		'movups',
		'movzx',
		'mul',
		'mulpd',
		'mulps',
		'mulsd',
		'mulss',
		'neg',
		'nop',
		'not',
		'or',
		'orpd',
		'orps',
		'out',
		'outsd',
		'packssdw',
		'packuswb',
		'paddd',
		'paddq',
		'paddsw',
		'paddusw',
		'pand',
		'pandn',
		'pause',
		'pavgw',
		'pcmpeqd',
		'pcmpgtd',
		'pextrw',
		'pinsrw',
		'pmaddwd',
		'pmaxsw',
		'pmaxub',
		'pminsw',
		'pminub',
		'pmovmskb',
		'pmulhuw',
		'pmulhw',
		'pmullw',
		'pmuludq',
		'pop',
		'popa',
		'popad',
		'popfd',
		'por',
		'prefetchh',
		'psadbw',
		'pshufd',
		'pshufhw',
		'pshuflw',
		'pshufw',
		'pslldq',
		'psllq',
		'psrad',
		'psrldq',
		'psrlq',
		'psubd',
		'psubq',
		'psubsw',
		'psubusw',
		'punpckhqdq',
		'punpcklqdq',
		'push',
		'pusha',
		'pushad',
		'pushfd',
		'pxor',
		'rcpps',
		'rcpss',
		'rdmsr',
		'rdpmc',
		'rdtsc',
		'repnz',
		'ret',
		'ror',
		'ror',
		'rsm',
		'rsqrtps',
		'rsqrtss',
		'sahf',
		'sbb',
		'scasd',
		'sfence',
		'sgdt',
		'shld',
		'shr',
		'shr',
		'shrd',
		'shufpd',
		'shufps',
		'sidt',
		'sldt',
		'smsw',
		'sqrtpd',
		'sqrtps',
		'sqrtsd',
		'sqrtss',
		'stc',
		'std',
		'sti',
		'stmxcsr',
		'stosd',
		'str',
		'sub',
		'subpd',
		'subps',
		'subsd',
		'subss',
		'sysenter',
		'sysexit',
		'test',
		'ucomisd',
		'ucomiss',
		'unpckhpd',
		'unpckhps',
		'unpcklpd',
		'unpcklps',
		'verw',
		'wbinvd',
		'wrmsr',
		'x',
		'xadd',
		'xchg',
		'xlatb',
		'xor',
		'xorpd',
		'xorps',
	);
	$self->listAdd('registers',
		'ah',
		'al',
		'ax',
		'bh',
		'bl',
		'bp',
		'bx',
		'ch',
		'cl',
		'cr0',
		'cr1',
		'cr2',
		'cr3',
		'cr4',
		'cs',
		'cx',
		'dh',
		'di',
		'dl',
		'ds',
		'dx',
		'eax',
		'ebp',
		'ebx',
		'ecx',
		'edi',
		'edx',
		'eip',
		'es',
		'esi',
		'esp',
		'fs',
		'gs',
		'ip',
		'mm0',
		'mm1',
		'mm2',
		'mm3',
		'mm4',
		'mm5',
		'mm6',
		'mm7',
		'si',
		'sp',
		'ss',
		'st',
		'xmm0',
		'xmm1',
		'xmm2',
		'xmm3',
		'xmm4',
		'xmm5',
		'xmm6',
		'xmm7',
	);
	$self->contextdata({
		'Comment' => {
			callback => \&parseComment,
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
	return 'Intel x86 (NASM)';
}

sub parseComment {
	my ($self, $text) = @_;
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'registers', 0, 0, undef, 0, '#stay', 'Registers')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'Data', 0, 0, undef, 0, '#stay', 'Data')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'instructions', 0, 0, undef, 0, '#stay', 'Instructions')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'NASM Keywords', 0, 0, undef, 0, '#stay', 'NASM Keywords')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '%', 0, 0, 0, undef, 0, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '"\'', 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '^\\s*[A-Za-z0-9_.$]+:', 0, 0, 0, undef, 0, '#stay', 'Label')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(cmov|fcmov|j|loop|set)(a|ae|b|be|c|e|g|ge|l|le|na|nae|nb|nbe|nc|ne|ng|nge|nl|nle|no|np|ns|nz|o|p|pe|po|s|z)', 0, 0, 0, undef, 0, '#stay', 'Instructions')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'cpu (pentium|ppro|p2|p3|katmai|p4|willamette|prescott|ia64)*', 0, 0, 0, undef, 0, '#stay', 'NASM Keywords')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\$[0-9]+[a-f0-9]*|[a-f0-9]+h)', 1, 0, 0, undef, 0, '#stay', 'BaseN')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([0-7]+(q|o)|[01]+b)', 1, 0, 0, undef, 0, '#stay', 'BaseN')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '$', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => HlCOct
	if ($self->testHlCOct($text, 0, undef, 0, '#stay', 'BaseN')) {
		return 1
	}
	# type => HlCHex
	if ($self->testHlCHex($text, 0, undef, 0, '#stay', 'BaseN')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	return 0;
};

sub parsePreprocessor {
	my ($self, $text) = @_;
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => AnyChar
	if ($self->testAnyChar($text, '"\'', 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Intel_x86_NASM - a Plugin for Intel x86 (NASM) syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Intel_x86_NASM;
 my $sh = new Syntax::Highlight::Engine::Kate::Intel_x86_NASM([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Intel_x86_NASM is a  plugin module that provides syntax highlighting
for Intel x86 (NASM) to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

