# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/cgis.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.02
#kate version 2.4
#generated: Sun May 28 21:18:24 2006, localtime

package Syntax::Highlight::Engine::Kate::CGiS;

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
		'Alert' => 'Alert',
		'Char' => 'Char',
		'Comment' => 'Comment',
		'Data Type' => 'DataType',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Hex' => 'BaseN',
		'Hint        ' => 'Others',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Region Marker' => 'RegionMarker',
		'String' => 'String',
		'String Char' => 'Char',
		'Symbol' => 'Normal',
	});
	$self->listAdd('keywords',
		'1D',
		'2D',
		'break',
		'continue',
		'do',
		'else',
		'extern',
		'for',
		'forall',
		'foreach',
		'function',
		'if',
		'in',
		'inout',
		'internal',
		'out',
		'reduction',
		'return',
		'struct',
		'typedef',
		'while',
	);
	$self->listAdd('types',
		'bool',
		'bool2',
		'bool3',
		'bool4',
		'float',
		'float2',
		'float3',
		'float4',
		'half',
		'half2',
		'half3',
		'half4',
		'int',
		'int2',
		'int3',
		'int4',
	);
	$self->contextdata({
		'Code' => {
			callback => \&parseCode,
			attribute => 'Normal Text',
		},
		'Commentar 1' => {
			callback => \&parseCommentar1,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Commentar 2' => {
			callback => \&parseCommentar2,
			attribute => 'Comment',
		},
		'Common' => {
			callback => \&parseCommon,
			attribute => 'Normal Text',
		},
		'Control' => {
			callback => \&parseControl,
			attribute => 'Normal Text',
		},
		'Hint' => {
			callback => \&parseHint,
			attribute => 'Hint',
		},
		'Interface' => {
			callback => \&parseInterface,
			attribute => 'Normal Text',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'Region Marker' => {
			callback => \&parseRegionMarker,
			attribute => 'Region Marker',
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
	return 'CGiS';
}

sub parseCode {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CONTROL', 0, 0, 0, undef, 0, 'Control', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#HINT', 0, 0, 0, undef, 0, 'Hint', 'Hint')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('Common', $text)) {
		return 1
	}
	return 0;
};

sub parseCommentar1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
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
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	return 0;
};

sub parseCommon {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '//BEGIN', 0, 0, 0, undef, 1, 'Region Marker', 'Region Marker')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '//END', 0, 0, 0, undef, 1, 'Region Marker', 'Region Marker')) {
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
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Float')) {
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
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
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
	return 0;
};

sub parseControl {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CODE', 0, 0, 0, undef, 0, 'Code', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('Common', $text)) {
		return 1
	}
	return 0;
};

sub parseHint {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Hint')) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	return 0;
};

sub parseInterface {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CONTROL', 0, 0, 0, undef, 0, 'Control', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'CODE', 0, 0, 0, undef, 0, 'Code', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('Common', $text)) {
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
	# type => StringDetect
	if ($self->testStringDetect($text, 'PROGRAM', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'INTERFACE', 0, 0, 0, undef, 0, 'Interface', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseRegionMarker {
	my ($self, $text) = @_;
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::CGiS - a Plugin for CGiS syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::CGiS;
 my $sh = new Syntax::Highlight::Engine::Kate::CGiS([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::CGiS is a  plugin module that provides syntax highlighting
for CGiS to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

