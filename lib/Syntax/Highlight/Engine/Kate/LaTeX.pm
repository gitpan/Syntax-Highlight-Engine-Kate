# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/latex.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.13
#kate version 2.4
#kate author Jeroen Wijnhout (Jeroen.Wijnhout@kdemail.net)
#generated: Wed Nov  1 21:17:49 2006, localtime

package Syntax::Highlight::Engine::Kate::LaTeX;

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
		'Comment' => 'Comment',
		'Environment' => 'DataType',
		'Keyword' => 'Keyword',
		'Keyword Mathmode' => 'Reserved',
		'Math' => 'Float',
		'Normal Text' => 'Normal',
		'Region Marker' => 'RegionMarker',
		'Structure' => 'String',
		'Verbatim' => 'BString',
	});
	$self->contextdata({
		'Comment' => {
			callback => \&parseComment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'ContrSeq' => {
			callback => \&parseContrSeq,
			attribute => 'Keyword',
			lineending => '#pop',
		},
		'Environment' => {
			callback => \&parseEnvironment,
			attribute => 'Environment',
		},
		'FindEnvironment' => {
			callback => \&parseFindEnvironment,
			attribute => 'Normal Text',
		},
		'Label' => {
			callback => \&parseLabel,
			attribute => 'Normal Text',
			lineending => '#pop#pop',
			fallthrough => '#pop#pop',
		},
		'MathContrSeq' => {
			callback => \&parseMathContrSeq,
			attribute => 'Keyword Mathmode',
			lineending => '#pop',
		},
		'MathEnv' => {
			callback => \&parseMathEnv,
			attribute => 'Environment',
		},
		'MathFindEnd' => {
			callback => \&parseMathFindEnd,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'MathMode' => {
			callback => \&parseMathMode,
			attribute => 'Math',
		},
		'MathModeEnv' => {
			callback => \&parseMathModeEnv,
			attribute => 'Math',
		},
		'Normal Text' => {
			callback => \&parseNormalText,
			attribute => 'Normal Text',
		},
		'ToEndOfLine' => {
			callback => \&parseToEndOfLine,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'Verb' => {
			callback => \&parseVerb,
			attribute => 'Verbatim',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'VerbFindEnd' => {
			callback => \&parseVerbFindEnd,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'Verbatim' => {
			callback => \&parseVerbatim,
			attribute => 'Verbatim',
		},
		'VerbatimEnv' => {
			callback => \&parseVerbatimEnv,
			attribute => 'Environment',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~');
	$self->basecontext('Normal Text');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'LaTeX';
}

sub parseComment {
	my ($self, $text) = @_;
	return 0;
};

sub parseContrSeq {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, 'verb*', 0, 0, 0, undef, 0, 'Verb', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'verb', 0, 0, 0, undef, 0, 'Verb', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z]+', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^a-zA-Z]', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseEnvironment {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(verbatim|lstlisting|boxedverbatim|Verbatim)\\*?', 0, 0, 0, undef, 0, 'VerbatimEnv', 'Environment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(equation|displaymath|eqnarray|math|multline)\\*?', 0, 0, 0, undef, 0, 'MathEnv', 'Environment')) {
		return 1
	}
	return 0;
};

sub parseFindEnvironment {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'Environment', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseLabel {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\{\\s*', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^\\}\\{]+', 0, 0, 0, undef, 0, '#stay', 'Environment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\}\\s*', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseMathContrSeq {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z]+', 0, 0, 0, undef, 0, '#pop', 'Keyword Mathmode')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^a-zA-Z]', 0, 0, 0, undef, 0, '#pop', 'Keyword Mathmode')) {
		return 1
	}
	return 0;
};

sub parseMathEnv {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, 'MathModeEnv', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseMathFindEnd {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z]*(equation|displaymath|eqnarray|math|multline)\\*?', 0, 0, 0, undef, 0, '#stay', 'Environment')) {
		return 1
	}
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop#pop#pop#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseMathMode {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#pop', 'Math')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#pop', 'Math')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\begin(?=[^a-zA-Z])', 0, 0, 0, undef, 0, '#stay', 'Keyword Mathmode')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\end(?=[^a-zA-Z])', 0, 0, 0, undef, 0, '#stay', 'Keyword Mathmode')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\\', 0, 0, 0, undef, 0, 'MathContrSeq', 'Keyword Mathmode')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '$$', 0, 0, 0, undef, 0, '#pop', 'Math')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '$', 0, 0, 0, undef, 0, '#pop', 'Math')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\s*BEGIN.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\s*END.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '%', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseMathModeEnv {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\end(?=\\s*\\{\\s*[a-zA-Z]*(equation|displaymath|eqnarray|math|multline)\\*?\\s*\\})', 0, 0, 0, undef, 0, 'MathFindEnd', 'Structure')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\begin(?=[^a-zA-Z])', 0, 0, 0, undef, 0, '#stay', 'Keyword Mathmode')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\end(?=[^a-zA-Z])', 0, 0, 0, undef, 0, '#stay', 'Keyword Mathmode')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '\\(', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '\\[', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\\', 0, 0, 0, undef, 0, 'MathContrSeq', 'Keyword Mathmode')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '$$', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '$', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\s*BEGIN.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\s*END.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '%', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseNormalText {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\begin(?=[^a-zA-Z])', 0, 0, 0, undef, 0, 'FindEnvironment', 'Structure')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\end(?=[^a-zA-Z])', 0, 0, 0, undef, 0, 'FindEnvironment', 'Structure')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\(label|pageref|ref|cite)(?=[^a-zA-Z])', 0, 0, 0, undef, 0, 'Label', 'Structure')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\(part|chapter|section|subsection|subsubsection|paragraph|subparagraph)(?=[^a-zA-Z])', 0, 0, 0, undef, 0, '#stay', 'Structure')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '\\renewcommand', 0, 0, 0, undef, 0, 'ToEndOfLine', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '\\newcommand', 0, 0, 0, undef, 0, 'ToEndOfLine', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '\\(', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '\\[', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\\', 0, 0, 0, undef, 0, 'ContrSeq', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '$$', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '$', 0, 0, 0, undef, 0, 'MathMode', 'Math')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\s*BEGIN.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\s*END.*$', 0, 0, 0, undef, 1, '#stay', 'Region Marker')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '%', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseToEndOfLine {
	my ($self, $text) = @_;
	return 0;
};

sub parseVerb {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(.).*?\\1', 0, 0, 0, undef, 0, '#pop#pop', 'Verbatim')) {
		return 1
	}
	return 0;
};

sub parseVerbFindEnd {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(verbatim|lstlisting|boxedverbatim|Verbatim)\\*?', 0, 0, 0, undef, 0, '#stay', 'Environment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop#pop#pop#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseVerbatim {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\end(?=\\{(verbatim|lstlisting|boxedverbatim|Verbatim)\\*?\\})', 0, 0, 0, undef, 0, 'VerbFindEnd', 'Structure')) {
		return 1
	}
	return 0;
};

sub parseVerbatimEnv {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '*', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, 'Verbatim', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::LaTeX - a Plugin for LaTeX syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::LaTeX;
 my $sh = new Syntax::Highlight::Engine::Kate::LaTeX([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::LaTeX is a  plugin module that provides syntax highlighting
for LaTeX to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

