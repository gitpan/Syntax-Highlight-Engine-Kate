# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/javadoc.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.03
#kate version 2.4
#kate author Alfredo Luiz Foltran Fialho (alfoltran@ig.com.br)
#generated: Wed Nov  1 21:17:48 2006, localtime

package Syntax::Highlight::Engine::Kate::Javadoc;

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
		'BlockTag' => 'Keyword',
		'InlineTag' => 'Keyword',
		'Javadoc' => 'Comment',
		'JavadocFS' => 'Comment',
		'JavadocParam' => 'Keyword',
		'Normal Text' => 'Normal',
		'SeeTag' => 'Keyword',
	});
	$self->contextdata({
		'FindJavadoc' => {
			callback => \&parseFindJavadoc,
			attribute => 'Normal Text',
		},
		'InlineTagar' => {
			callback => \&parseInlineTagar,
			attribute => 'InlineTag',
			lineending => '#pop',
		},
		'JavadocFSar' => {
			callback => \&parseJavadocFSar,
			attribute => 'JavadocFS',
		},
		'JavadocParam' => {
			callback => \&parseJavadocParam,
			attribute => 'Javadoc',
			lineending => '#pop',
		},
		'Javadocar' => {
			callback => \&parseJavadocar,
			attribute => 'Javadoc',
		},
		'LiteralTagar' => {
			callback => \&parseLiteralTagar,
			attribute => 'InlineTag',
			lineending => '#pop',
		},
		'SeeTag' => {
			callback => \&parseSeeTag,
			attribute => 'SeeTag',
			lineending => '#pop',
		},
		'Start' => {
			callback => \&parseStart,
			attribute => 'Normal Text',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Start');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Javadoc';
}

sub parseFindJavadoc {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '/**', 0, 0, 0, undef, 0, 'JavadocFSar', 'JavadocFS')) {
		return 1
	}
	return 0;
};

sub parseInlineTagar {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'InlineTag')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop#pop#pop', 'JavadocFS')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('HTML', $text)) {
		return 1
	}
	return 0;
};

sub parseJavadocFSar {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'JavadocFS')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(!|\\?)', 0, 0, 0, undef, 0, 'Javadocar', 'JavadocFS')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\.\\s*$)', 0, 0, 0, undef, 0, 'Javadocar', 'JavadocFS')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\.\\s)(?![\\da-z])', 0, 0, 0, undef, 0, 'Javadocar', 'JavadocFS')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\**\\s*(?=@(author|deprecated|exception|param|return|see|serial|serialData|serialField|since|throws|version)(\\s|$))', 0, 0, 0, undef, 1, 'Javadocar', 'JavadocFS')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@code ', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@code	', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@docRoot}', 0, 0, 0, undef, 0, '#stay', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@inheritDoc}', 0, 0, 0, undef, 0, '#stay', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@link ', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@link	', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@linkplain ', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@linkplain	', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@literal ', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@literal	', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@value}', 0, 0, 0, undef, 0, '#stay', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@value ', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@value	', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('HTML', $text)) {
		return 1
	}
	return 0;
};

sub parseJavadocParam {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S*(?=\\*/)', 0, 0, 0, undef, 0, '#pop#pop', 'JavadocParam')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S*(\\s|$)', 0, 0, 0, undef, 0, '#pop', 'JavadocParam')) {
		return 1
	}
	return 0;
};

sub parseJavadocar {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop#pop', 'JavadocFS')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\*+(?!/)', 0, 0, 0, undef, 1, '#stay', 'JavadocFS')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@author ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@deprecated ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@exception ', 0, 0, 0, undef, 0, 'JavadocParam', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@param ', 0, 0, 0, undef, 0, 'JavadocParam', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@return ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@see ', 0, 0, 0, undef, 0, 'SeeTag', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@serial ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@serialData ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@serialField ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@since ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@throws ', 0, 0, 0, undef, 0, 'JavadocParam', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@version ', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@author	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@deprecated	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@exception	', 0, 0, 0, undef, 0, 'JavadocParam', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@param	', 0, 0, 0, undef, 0, 'JavadocParam', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@return	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@see	', 0, 0, 0, undef, 0, 'SeeTag', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@serial	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@serialData	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@serialField	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@since	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@throws	', 0, 0, 0, undef, 0, 'JavadocParam', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '@version	', 0, 0, 0, undef, 0, '#stay', 'BlockTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@code ', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@code	', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@docRoot}', 0, 0, 0, undef, 0, '#stay', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@inheritDoc}', 0, 0, 0, undef, 0, '#stay', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@link ', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@link	', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@linkplain ', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@linkplain	', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@literal ', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@literal	', 0, 0, 0, undef, 0, 'LiteralTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@value}', 0, 0, 0, undef, 0, '#stay', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@value ', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '{@value	', 0, 0, 0, undef, 0, 'InlineTagar', 'InlineTag')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('HTML', $text)) {
		return 1
	}
	return 0;
};

sub parseLiteralTagar {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'InlineTag')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop#pop#pop', 'JavadocFS')) {
		return 1
	}
	return 0;
};

sub parseSeeTag {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop#pop#pop', 'JavadocFS')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('HTML', $text)) {
		return 1
	}
	return 0;
};

sub parseStart {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('FindJavadoc', $text)) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Javadoc - a Plugin for Javadoc syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Javadoc;
 my $sh = new Syntax::Highlight::Engine::Kate::Javadoc([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Javadoc is a  plugin module that provides syntax highlighting
for Javadoc to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

