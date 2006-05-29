# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/inform.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.23
#kate version 2.3
#kate author Giancarlo Niccolai (giancarlo@niccolai.ws)
#generated: Sun May 28 21:18:32 2006, localtime

package Syntax::Highlight::Engine::Kate::Inform;

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
		'Actions' => 'DataType',
		'Comment' => 'Comment',
		'Function' => 'Function',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Number' => 'DecVal',
		'OpCode' => 'Reserved',
		'Operator' => 'Operator',
		'Pragma' => 'Others',
		'PredefFunction' => 'Function',
		'String' => 'String',
		'Values' => 'BaseN',
		'Word' => 'IString',
	});
	$self->listAdd('ClassDeclOps',
		'has',
		'private',
		'with',
	);
	$self->listAdd('actions',
		'Answer',
		'Ask',
		'AskFor',
		'Attack',
		'Blow',
		'Burn',
		'Buy',
		'Climb',
		'Climb',
		'Close',
		'Consult',
		'Cut',
		'Dig',
		'Disrobe',
		'Drink',
		'Drop',
		'Eat',
		'Empty',
		'Empty',
		'EmptyT',
		'Enter',
		'Examine',
		'Exit',
		'Fill',
		'FullScore',
		'GetOff',
		'GetOff',
		'Give',
		'Go',
		'GoIn',
		'GoIn',
		'Insert',
		'Inv',
		'Inv',
		'InvTall',
		'InvWide',
		'Jump',
		'JumpOn',
		'Kiss',
		'LMode1',
		'LMode2',
		'LMode3',
		'LetGo',
		'Listen',
		'Lock',
		'Look',
		'Mild',
		'No',
		'NotifyOff',
		'NotifyOn',
		'Objects',
		'Open',
		'Places',
		'Pray',
		'Pronouns',
		'Pull',
		'Push',
		'PushDir',
		'PutOn',
		'Quit',
		'Receive',
		'Restart',
		'Restore',
		'Rub',
		'Save',
		'Score',
		'ScriptOff',
		'ScriptOn',
		'Search',
		'Set',
		'SetTo',
		'Show',
		'Sing',
		'Sing',
		'Sing',
		'Sleep',
		'Smell',
		'Sorry',
		'Squeeze',
		'Strong',
		'Swim',
		'Swing',
		'SwitchOff',
		'SwitchOn',
		'Take',
		'Taste',
		'Tell',
		'Think',
		'ThrowAt',
		'ThrownAt',
		'Tie',
		'Touch',
		'Transfer',
		'Turn',
		'Unlock',
		'VagueGo',
		'Verify',
		'Version',
		'Wave',
		'WaveHands',
		'Wear',
		'Yes',
	);
	$self->listAdd('functions',
		'Achieved',
		'AddToScope',
		'CDefArt',
		'ChangeDefault',
		'DefArt',
		'DoMenu',
		'EnglishNumber',
		'HasLightSource',
		'InDefArt',
		'Locale',
		'LoopOverScope',
		'NextWord',
		'NextWordStopped',
		'NounDomain',
		'ObjectIsUntouchable',
		'OffersLight',
		'PlaceInScope',
		'PlayerTo',
		'PrintShortName',
		'ScopeWithin',
		'SetTime',
		'StartDaemon',
		'StartTimer',
		'StopDaemon',
		'StopTimer',
		'TestScope',
		'TryNumber',
		'UnsignedCompare',
		'WordAddress',
		'WordLenght',
		'WriteListFrom',
		'YesOrNo',
		'ZRegion',
		'allowpushdir',
		'child',
		'children',
		'metaclass',
		'parent',
	);
	$self->listAdd('inline_pragmas',
		'#else',
		'#endif',
		'#ifdef',
		'#ifndef',
	);
	$self->listAdd('keywords',
		'box',
		'break',
		'continue',
		'do',
		'else',
		'font',
		'for',
		'give',
		'if',
		'inversion',
		'jump',
		'move',
		'new_line',
		'objectloop',
		'on',
		'print',
		'print_ret',
		'quit',
		'read',
		'remove',
		'restore',
		'return',
		'rfalse',
		'rtrue',
		'save',
		'spaces',
		'spring',
		'style',
		'switch',
		'to',
		'until',
	);
	$self->listAdd('operators',
		'has',
		'hasn\\\'t',
		'in',
		'notin',
		'ofclass',
		'or',
		'provides',
	);
	$self->listAdd('pragmas',
		'Abbreviate',
		'Array',
		'Attribute',
		'Constant',
		'Default',
		'End',
		'Endif',
		'Extend',
		'Global',
		'Ifdef',
		'Iffalse',
		'Iffalse',
		'Ifndef',
		'Ifnot',
		'Ifnot',
		'Iftrue',
		'Iftrue',
		'Import',
		'Include',
		'Link',
		'Lowstring',
		'Message',
		'Property',
		'Release',
		'Replace',
		'Serial',
		'Statusline',
		'Switches',
		'System_file',
		'Verb',
		'score',
	);
	$self->listAdd('special_vals',
		'Routine',
		'String',
		'action',
		'actor',
		'actors_location',
		'bold',
		'buffer',
		'consult_from',
		'consult_words',
		'false',
		'fixed',
		'location',
		'nothing',
		'noun',
		'off',
		'on',
		'player',
		'roman',
		'score',
		'second',
		'self',
		'sender',
		'the_time',
		'true',
		'underline',
		'wn',
	);
	$self->contextdata({
		'ClassDecl' => {
			callback => \&parseClassDecl,
			attribute => 'Normal Text',
			lineending => 'ClassDecl_1',
		},
		'ClassDecl_1' => {
			callback => \&parseClassDecl_1,
			attribute => 'Normal Text',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'PropDefVal rules' => {
			callback => \&parsePropDefValrules,
			attribute => 'Normal Text',
		},
		'TopLevel' => {
			callback => \&parseTopLevel,
			attribute => 'Normal Text',
		},
		'comment' => {
			callback => \&parsecomment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'funcdef' => {
			callback => \&parsefuncdef,
			attribute => 'Normal Text',
		},
		'has_decl' => {
			callback => \&parsehas_decl,
			attribute => 'Normal Text',
		},
		'prop_def' => {
			callback => \&parseprop_def,
			attribute => 'Normal Text',
		},
		'prop_func_def' => {
			callback => \&parseprop_func_def,
			attribute => 'Normal Text',
		},
		'string' => {
			callback => \&parsestring,
			attribute => 'String',
		},
		'word' => {
			callback => \&parseword,
			attribute => 'Word',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('TopLevel');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Inform';
}

sub parseClassDecl {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('PropDefVal rules', $text)) {
		return 1
	}
	return 0;
};

sub parseClassDecl_1 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '^[\\t ]*has ', 1, 0, 0, undef, 0, 'has_decl', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'ClassDeclOps', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, 'prop_def', 'Function')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, '#pop', 'Pragma')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '!', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'string', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'word', 'Word')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'inline_pragmas', 0, 0, undef, 0, '#stay', 'Pragma')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--?>', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'actions', 0, 0, undef, 0, '#stay', 'Actions')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'functions', 0, 0, undef, 0, '#stay', 'PredefFunction')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'special_vals', 0, 0, undef, 0, '#stay', 'Values')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'operators', 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '##[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, '#stay', 'Actions')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '@[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, '#stay', 'OpCode')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[0-9a-fA-F]{1,4}', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\d+', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '%&()+-<=>{|}~', 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsePropDefValrules {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '!', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'string', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'word', 'Word')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'prop_func_def', 'Function')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ',', 0, 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[0-9a-fA-F]{1,4}', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\d+', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	return 0;
};

sub parseTopLevel {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '!', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'string', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[[]\\s*[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, 'funcdef', 'Function')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ' *object | *class ', 1, 0, 0, 0, 0, 'ClassDecl', 'Pragma')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'pragmas', 0, 0, undef, 0, '#stay', 'Pragma')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'inline_pragmas', 0, 0, undef, 0, '#stay', 'Pragma')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--?>', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z_]+\\d*', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[0-9a-fA-F]{1,4}', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\d+', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	return 0;
};

sub parsecomment {
	my ($self, $text) = @_;
	return 0;
};

sub parsefuncdef {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Normal', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ']', ';', 0, 0, 0, undef, 0, '#pop', 'Function')) {
		return 1
	}
	return 0;
};

sub parsehas_decl {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Pragma')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('PropDefVal rules', $text)) {
		return 1
	}
	return 0;
};

sub parseprop_def {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ',', 0, 0, 0, undef, 0, '#pop', 'Function')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Pragma')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'prop_func_def', 'Function')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('PropDefVal rules', $text)) {
		return 1
	}
	return 0;
};

sub parseprop_func_def {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Function')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('Normal', $text)) {
		return 1
	}
	return 0;
};

sub parsestring {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parseword {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Word')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Inform - a Plugin for Inform syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Inform;
 my $sh = new Syntax::Highlight::Engine::Kate::Inform([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Inform is a  plugin module that provides syntax highlighting
for Inform to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

