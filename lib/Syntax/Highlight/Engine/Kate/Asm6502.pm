# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/asm6502.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.04
#kate version 2.1
#generated: Wed Nov  1 21:17:44 2006, localtime

package Syntax::Highlight::Engine::Kate::Asm6502;

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
		'Command' => 'Normal',
		'Comment' => 'Comment',
		'Data Type' => 'DataType',
		'Decimal' => 'DecVal',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Operator' => 'Others',
		'Parameter' => 'Others',
		'Preprocessor' => 'Others',
		'String' => 'String',
		'Substitution' => 'Others',
	});
	$self->contextdata({
		'Base' => {
			callback => \&parseBase,
			attribute => 'Normal Text',
		},
		'Commentar 2' => {
			callback => \&parseCommentar2,
			attribute => 'Comment',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Base');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Asm6502';
}

sub parseBase {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '#define.*$', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#include .*$', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ';.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.byte', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.byt', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.word', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.asc', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.dsb', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.fopt', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.text', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.data', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.bss', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.zero', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.align', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[A-Za-z0-9]*', 0, 0, 0, undef, 0, '#stay', 'Hex')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ',x$', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ',y$', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'TAX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'ADC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'AND', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'ASL', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BCC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BCS', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BEQ', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BIT', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BMI', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BNE', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BPL', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BRK', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BVC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'BVS', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CLC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CLD', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CLI', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CLV', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CMP', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CPX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CPY', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'DEC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'DEX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'DEY', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'EOR', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'INC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'INX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'INY', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'JMP', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'JSR', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'LDA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'LDX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'LDY', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'LSR', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'NOP', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'ORA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'PHA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'PHP', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'PLA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'PLP', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'ROL', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'ROR', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'RTI', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'RTS', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'SBC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'SEC', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'SED', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'SEI', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'STA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'STX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'STY', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'TAY', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'TSX', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'TXA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'TXS', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'TYA', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\*=', 0, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '"', '"', 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '-+<>=;', 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Commentar 2', 'Comment')) {
		return 1
	}
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


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Asm6502 - a Plugin for Asm6502 syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Asm6502;
 my $sh = new Syntax::Highlight::Engine::Kate::Asm6502([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Asm6502 is a  plugin module that provides syntax highlighting
for Asm6502 to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

