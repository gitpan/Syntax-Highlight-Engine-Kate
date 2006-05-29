# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/debianchangelog.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 0.62
#kate version 2.4
#generated: Sun May 28 21:18:27 2006, localtime

package Syntax::Highlight::Engine::Kate::Debian_Changelog;

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
		'Bug' => 'DataType',
		'Data' => 'DataType',
		'Email' => 'Others',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Version' => 'DataType',
	});
	$self->listAdd('distributions',
		'experimental',
		'frozen',
		'stable',
		'testing',
		'unstable',
	);
	$self->listAdd('keywords',
		'urgency',
	);
	$self->listAdd('urgencies',
		'bug',
		'emergency',
		'high',
		'low',
		'medium',
	);
	$self->contextdata({
		'Head' => {
			callback => \&parseHead,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'Version' => {
			callback => \&parseVersion,
			attribute => 'Version',
			lineending => '#pop',
		},
		'noname' => {
			callback => \&parsenoname,
			attribute => 'Normal Text',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('noname');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Debian Changelog';
}

sub parseHead {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'Version', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[,;=]', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'distributions', 0, 0, undef, 0, '#stay', 'Data')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'urgencies', 0, 0, undef, 0, '#stay', 'Data')) {
		return 1
	}
	return 0;
};

sub parseVersion {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsenoname {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[^ ]*', 0, 0, 0, 0, 0, 'Head', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<.*@.*>', 0, 0, 0, undef, 0, '#stay', 'Email')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ' \\-\\-', 0, 0, 0, 0, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '  \\*', 0, 0, 0, 0, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[Cc][Ll][Oo][Ss][Ee][Ss]:[\\s]*(([Bb][Uu][Gg]\\s*)?#\\s*\\d+)(\\s*, *([Bb[Uu][Gg]\\s*)?#\\s*\\d+)*', 0, 0, 0, undef, 0, '#stay', 'Bug')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Debian_Changelog - a Plugin for Debian Changelog syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Debian_Changelog;
 my $sh = new Syntax::Highlight::Engine::Kate::Debian_Changelog([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Debian_Changelog is a  plugin module that provides syntax highlighting
for Debian Changelog to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

