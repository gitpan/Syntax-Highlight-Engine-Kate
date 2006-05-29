# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/gettext.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.01
#kate version 2.4
#kate author Dominik Haumann (dhdev@gmx.de)
#generated: Sun May 28 21:18:30 2006, localtime

package Syntax::Highlight::Engine::Kate::GNU_Gettext;

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
		'Automatic Comment' => 'Comment',
		'Char' => 'Char',
		'Flag' => 'Comment',
		'Index' => 'DecVal',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Reference' => 'Comment',
		'String' => 'String',
		'Translator Comment' => 'Comment',
	});
	$self->contextdata({
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'GNU Gettext';
}

sub parseNormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '^(msgid_plural|msgid|msgstr)', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\..*$', 0, 0, 0, 0, 0, '#stay', 'Automatic Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#:.*$', 0, 0, 0, 0, 0, '#stay', 'Reference')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#,.*$', 0, 0, 0, 0, 0, '#stay', 'Flag')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#.*$', 0, 0, 0, 0, 0, '#stay', 'Translator Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\.', 0, 0, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[\\d+\\]', 0, 0, 0, undef, 0, '#stay', 'Index')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\.', 0, 0, 0, undef, 0, '#stay', 'Char')) {
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

Syntax::Highlight::Engine::Kate::GNU_Gettext - a Plugin for GNU Gettext syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::GNU_Gettext;
 my $sh = new Syntax::Highlight::Engine::Kate::GNU_Gettext([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::GNU_Gettext is a  plugin module that provides syntax highlighting
for GNU Gettext to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

