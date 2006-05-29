# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/ahdl.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.04
#kate version 2.4
#kate author Dominik Haumann (dhdev@gmx.de)
#generated: Sun May 28 21:18:22 2006, localtime

package Syntax::Highlight::Engine::Kate::AHDL;

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
		'Bit' => 'DecVal',
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Data Type' => 'DataType',
		'Decimal' => 'DecVal',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Operator' => 'Others',
		'Region Marker' => 'RegionMarker',
		'String' => 'String',
	});
	$self->listAdd('keywords',
		'assert',
		'bidir',
		'bits',
		'buried',
		'case',
		'clique',
		'connected_pins',
		'constant',
		'defaults',
		'define',
		'design',
		'device',
		'else',
		'elsif',
		'for',
		'function',
		'generate',
		'gnd',
		'help_id',
		'in',
		'include',
		'input',
		'is',
		'machine',
		'node',
		'of',
		'options',
		'others',
		'output',
		'parameters',
		'returns',
		'states',
		'subdesign',
		'then',
		'title',
		'to',
		'tri_state_node',
		'variable',
		'vcc',
		'when',
		'with',
	);
	$self->listAdd('operator',
		'and',
		'ceil',
		'div',
		'floor',
		'log2',
		'mod',
		'nand',
		'nor',
		'not',
		'or',
		'used',
		'xnor',
		'xor',
	);
	$self->listAdd('types',
		'carry',
		'cascade',
		'dff',
		'dffe',
		'exp',
		'global',
		'jkff',
		'jkffe',
		'latch',
		'lcell',
		'mcell',
		'memory',
		'opendrn',
		'soft',
		'srff',
		'srffe',
		'tff',
		'tffe',
		'tri',
		'wire',
		'x',
	);
	$self->contextdata({
		'comment' => {
			callback => \&parsecomment,
			attribute => 'Comment',
		},
		'normal' => {
			callback => \&parsenormal,
			attribute => 'Normal Text',
		},
		'string' => {
			callback => \&parsestring,
			attribute => 'String',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('normal');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'AHDL';
}

sub parsecomment {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '%', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsenormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdefaults\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend\\s+defaults\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bif\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend\\s+if\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\btable\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend\\s+table\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bcase\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend\\s+case\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bbegin\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
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
	# type => keyword
	if ($self->testKeyword($text, 'operator', 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b(\\d+)\\b', 0, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bb"(0|1|x)+"', 1, 0, 0, undef, 0, '#stay', 'Bit')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b(o|q)"[0-7*]"', 1, 0, 0, undef, 0, '#stay', 'Octal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b(h|x)"[0-9a-f]*"', 1, 0, 0, undef, 0, '#stay', 'Hex')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'string', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--\\s*BEGIN.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--\\s*END.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '%', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	return 0;
};

sub parsestring {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '"', 0, 0, 0, undef, 0, '#stay', 'Char')) {
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

Syntax::Highlight::Engine::Kate::AHDL - a Plugin for AHDL syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::AHDL;
 my $sh = new Syntax::Highlight::Engine::Kate::AHDL([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::AHDL is a  plugin module that provides syntax highlighting
for AHDL to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

