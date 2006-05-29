# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/debiancontrol.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 0.82
#kate version 2.4
#generated: Sun May 28 21:18:27 2006, localtime

package Syntax::Highlight::Engine::Kate::Debian_Control;

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
		'Email' => 'Others',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Value' => 'DataType',
		'Variable' => 'Others',
		'Version' => 'DecVal',
	});
	$self->contextdata({
		'Constrain' => {
			callback => \&parseConstrain,
			attribute => 'Version',
		},
		'DependencyField' => {
			callback => \&parseDependencyField,
			attribute => 'Value',
			lineending => '#pop',
		},
		'Field' => {
			callback => \&parseField,
			attribute => 'Value',
			lineending => '#pop',
		},
		'Variable' => {
			callback => \&parseVariable,
			attribute => 'Variable',
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
	return 'Debian Control';
}

sub parseConstrain {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '$', '{', 0, 0, 0, undef, 0, 'Variable', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[!<=>]', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseDependencyField {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '<.*@.*>', 0, 0, 0, undef, 0, '#stay', 'Email')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '$', '{', 0, 0, 0, undef, 0, 'Variable', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[,\\|]', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'Constrain', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'Constrain', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseField {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '<.*@.*>', 0, 0, 0, undef, 0, '#stay', 'Email')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '$', '{', 0, 0, 0, undef, 0, 'Variable', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseVariable {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsenoname {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, 'Depends:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Recommends:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Suggests:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Conflicts:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Provides:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Replaces:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Enhances:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Pre-Depends:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Build-Depends:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Build-Depends-Indep:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Build-Conflicts:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'Build-Conflicts-Indep:', 0, 0, 0, undef, 0, 'DependencyField', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^ ]*?:', 0, 0, 0, 0, 0, 'Field', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ' ', 0, 0, 0, 0, 0, 'Field', 'Value')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Debian_Control - a Plugin for Debian Control syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Debian_Control;
 my $sh = new Syntax::Highlight::Engine::Kate::Debian_Control([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Debian_Control is a  plugin module that provides syntax highlighting
for Debian Control to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

