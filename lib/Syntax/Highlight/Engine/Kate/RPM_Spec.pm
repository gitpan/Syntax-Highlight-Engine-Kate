# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/rpmspec.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.04
#kate version 2.4
#generated: Wed Nov  1 21:17:52 2006, localtime

package Syntax::Highlight::Engine::Kate::RPM_Spec;

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
		'Blue' => 'DecVal',
		'Comment' => 'Comment',
		'Data' => 'DataType',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Red' => 'String',
	});
	$self->listAdd('keywords',
		'BuildRequires',
		'BuildRoot',
		'Copyright',
		'Group',
		'License',
		'Name',
		'Packager',
		'Prefix',
		'Provides',
		'Release',
		'Requires',
		'Serial',
		'Source',
		'Summary',
		'URL',
		'Url',
		'Vendor',
		'Version',
	);
	$self->listAdd('types',
		'Artistic',
		'GPL',
		'LGPL',
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
		'Some Context' => {
			callback => \&parseSomeContext,
			attribute => 'Keyword',
			lineending => '#pop',
		},
		'Some Context2' => {
			callback => \&parseSomeContext2,
			attribute => 'Blue',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'RPM Spec';
}

sub parseComment {
	my ($self, $text) = @_;
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Data')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%\\w*', 0, 0, 0, undef, 0, '#stay', 'Red')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\{\\w*', 0, 0, 0, undef, 0, 'Some Context', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<\\s*[\\w@\\.]*', 0, 0, 0, undef, 0, 'Some Context2', 'Blue')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\w*', 0, 0, 0, undef, 0, '#stay', 'Data')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(Source|Patch)\\d*', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\*.*', 0, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, '#stay', 'Blue')) {
		return 1
	}
	return 0;
};

sub parseSomeContext {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseSomeContext2 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'Blue')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::RPM_Spec - a Plugin for RPM Spec syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::RPM_Spec;
 my $sh = new Syntax::Highlight::Engine::Kate::RPM_Spec([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::RPM_Spec is a  plugin module that provides syntax highlighting
for RPM Spec to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

