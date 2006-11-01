# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/velocity.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.04
#kate version 2.1
#kate author John Christopher (John@animalsinneed.net)
#generated: Wed Nov  1 21:17:54 2006, localtime

package Syntax::Highlight::Engine::Kate::Velocity;

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
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Other' => 'Others',
		'Properties' => 'BaseN',
		'Variable' => 'Variable',
	});
	$self->listAdd('keywords',
		'#else',
		'#elseif',
		'#end',
		'#foreach',
		'#if',
		'#include',
		'#macro',
		'#parse',
		'#set',
		'#stop',
	);
	$self->contextdata({
		'Keyword' => {
			callback => \&parseKeyword,
			attribute => 'Normal Text',
		},
		'multilinecomment' => {
			callback => \&parsemultilinecomment,
			attribute => 'Comment',
		},
		'singleline comment' => {
			callback => \&parsesinglelinecomment,
			attribute => 'Comment',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Keyword');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Velocity';
}

sub parseKeyword {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff\\.\\-]*(\\[[a-zA-Z0-9_]*\\])*', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\{[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff\\.\\-]*(\\[[a-zA-Z0-9_]*\\])*\\}', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$!\\{[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff\\.\\-]*(\\[[a-zA-Z0-9_]*\\])*\\}.', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\{\\$[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff\\.\\-]*(\\[([0-9]*|"[a-zA-Z_]*")|\'[a-zA-Z_]*\'|\\])*(->[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*(\\[[a-zA-Z0-9_]*\\])*(\\[([0-9]*|"[a-zA-Z_]*")|\'[a-zA-Z_]*\'|\\])*)*\\}', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff\\-]*(\\[[a-zA-Z0-9_]*\\])*\\.[a-zA-Z0-9_\\x7f-\\xff\\-]*', 0, 0, 0, undef, 0, '#stay', 'Properties')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '(),[]', 0, 0, undef, 0, '#stay', 'Other')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '#', 0, 0, 0, undef, 0, 'singleline comment', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '*', 0, 0, 0, undef, 0, 'multilinecomment', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsemultilinecomment {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '#', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsesinglelinecomment {
	my ($self, $text) = @_;
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Velocity - a Plugin for Velocity syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Velocity;
 my $sh = new Syntax::Highlight::Engine::Kate::Velocity([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Velocity is a  plugin module that provides syntax highlighting
for Velocity to the Syntax::Haghlight::Engine::Kate highlighting engine.

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
