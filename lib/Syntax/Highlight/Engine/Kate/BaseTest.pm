# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'testxml/base_test.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 0.12
#kate version 2.3
#kate author Hans Jeuken
#generated: Sun May 28 21:18:50 2006, localtime

package Syntax::Highlight::Engine::Kate::BaseTest;

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
		'Comment' => 'Comment',
		'Match' => 'DataType',
		'Match2' => 'String',
		'Match3' => 'Char',
		'Match4' => 'DataType',
		'Match5' => 'String',
		'Normal Text' => 'Normal',
		'Test Area' => 'Others',
	});
	$self->listAdd('shortwords',
		'&&',
		'.and.',
		';',
		'at',
		'for.now',
		'he',
		'her',
		'his',
		'in',
		'it',
		'she',
		'the',
	);
	$self->contextdata({
		'AnyChar_T' => {
			callback => \&parseAnyChar_T,
			attribute => 'Test Area',
		},
		'Base' => {
			callback => \&parseBase,
			attribute => 'Normal Text',
		},
		'Capture_T' => {
			callback => \&parseCapture_T,
			attribute => 'Test Area',
		},
		'ChildRule_T' => {
			callback => \&parseChildRule_T,
			attribute => 'Test Area',
		},
		'Column_T' => {
			callback => \&parseColumn_T,
			attribute => 'Test Area',
		},
		'Comment_T' => {
			callback => \&parseComment_T,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Comment_T2' => {
			callback => \&parseComment_T2,
			attribute => 'Comment',
		},
		'Compat_1' => {
			callback => \&parseCompat_1,
			attribute => 'Test Area',
		},
		'Detect2Chars_T' => {
			callback => \&parseDetect2Chars_T,
			attribute => 'Test Area',
		},
		'DetectChar_T' => {
			callback => \&parseDetectChar_T,
			attribute => 'Test Area',
		},
		'Dynamic1' => {
			callback => \&parseDynamic1,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'Dynamic2' => {
			callback => \&parseDynamic2,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'Dynamic3' => {
			callback => \&parseDynamic3,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'Dynamic4' => {
			callback => \&parseDynamic4,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'Dynamic_2Chars_T' => {
			callback => \&parseDynamic_2Chars_T,
			attribute => 'Test Area',
		},
		'Dynamic_Char_T' => {
			callback => \&parseDynamic_Char_T,
			attribute => 'Test Area',
		},
		'Dynamic_Reg_T' => {
			callback => \&parseDynamic_Reg_T,
			attribute => 'Test Area',
		},
		'Dynamic_String_T' => {
			callback => \&parseDynamic_String_T,
			attribute => 'Test Area',
		},
		'FirstNonSpace_T' => {
			callback => \&parseFirstNonSpace_T,
			attribute => 'Test Area',
		},
		'Float_T' => {
			callback => \&parseFloat_T,
			attribute => 'Test Area',
		},
		'HlCChar_T' => {
			callback => \&parseHlCChar_T,
			attribute => 'Test Area',
		},
		'HlCHex_T' => {
			callback => \&parseHlCHex_T,
			attribute => 'Test Area',
		},
		'HlCOct_T' => {
			callback => \&parseHlCOct_T,
			attribute => 'Test Area',
		},
		'HlCStringChar_T' => {
			callback => \&parseHlCStringChar_T,
			attribute => 'Test Area',
		},
		'IncludeModule_T' => {
			callback => \&parseIncludeModule_T,
			attribute => 'Test Area',
		},
		'IncludeRules_T' => {
			callback => \&parseIncludeRules_T,
			attribute => 'Test Area',
		},
		'Int_T' => {
			callback => \&parseInt_T,
			attribute => 'Test Area',
		},
		'LineContinue_T' => {
			callback => \&parseLineContinue_T,
			attribute => 'Test Area',
		},
		'Minimal_T' => {
			callback => \&parseMinimal_T,
			attribute => 'Test Area',
		},
		'RangeDetect_T' => {
			callback => \&parseRangeDetect_T,
			attribute => 'Test Area',
		},
		'RegExpr_T' => {
			callback => \&parseRegExpr_T,
			attribute => 'Test Area',
		},
		'StringDetect_T' => {
			callback => \&parseStringDetect_T,
			attribute => 'Test Area',
		},
		'keyword_T' => {
			callback => \&parsekeyword_T,
			attribute => 'Test Area',
		},
	});
	$self->deliminators('\\s||\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Base');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'BaseTest';
}

sub parseAnyChar_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</AnyChar>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, 'aeiouy', 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseBase {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '<AnyChar>', 0, 0, 0, undef, 0, 'AnyChar_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<DetectChar>', 0, 0, 0, undef, 0, 'DetectChar_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Detect2Chars>', 0, 0, 0, undef, 0, 'Detect2Chars_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Float>', 0, 0, 0, undef, 0, 'Float_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<HlCChar>', 0, 0, 0, undef, 0, 'HlCChar_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<HlCHex>', 0, 0, 0, undef, 0, 'HlCHex_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<HlCOct>', 0, 0, 0, undef, 0, 'HlCOct_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<HlCStringChar>', 0, 0, 0, undef, 0, 'HlCStringChar_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<IncludeRules>', 0, 0, 0, undef, 0, 'IncludeRules_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Int>', 0, 0, 0, undef, 0, 'Int_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<keyword>', 0, 0, 0, undef, 0, 'keyword_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<LineContinue>', 0, 0, 0, undef, 0, 'LineContinue_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<RangeDetect>', 0, 0, 0, undef, 0, 'RangeDetect_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<RegExpr>', 0, 0, 0, undef, 0, 'RegExpr_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<StringDetect>', 0, 0, 0, undef, 0, 'StringDetect_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<ChildRule>', 0, 0, 0, undef, 0, 'ChildRule_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<IncludeModule>', 0, 0, 0, undef, 0, 'IncludeModule_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Column>', 0, 0, 0, undef, 0, 'Column_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<FirstNonSpace>', 0, 0, 0, undef, 0, 'FirstNonSpace_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<DynReg>', 0, 0, 0, undef, 0, 'Dynamic_Reg_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<DynString>', 0, 0, 0, undef, 0, 'Dynamic_String_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<DynChar>', 0, 0, 0, undef, 0, 'Dynamic_Char_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Dyn2Chars>', 0, 0, 0, undef, 0, 'Dynamic_2Chars_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Capt>', 0, 0, 0, undef, 0, 'Capture_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Minimal>', 0, 0, 0, undef, 0, 'Minimal_T', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<Compat1>', 0, 0, 0, undef, 0, 'Compat_1', 'Test Area')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('XML', $text)) {
		return 1
	}
	return 0;
};

sub parseCapture_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Capt', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(.).*\\1', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseChildRule_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</ChildRule>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Match')) {
		# type => StringDetect
		if ($self->testStringDetect($text, 's', 1, 0, 0, undef, 0, '#stay', 'Match')) {
			return 1
		}
	}
	return 0;
};

sub parseColumn_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Column>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '.', 0, 0, 0, 5, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseComment_T {
	my ($self, $text) = @_;
	return 0;
};

sub parseComment_T2 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 0, 'Comment_T', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseCompat_1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Compat1>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\~', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDetect2Chars_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Detect2Chars>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, 'i', 'n', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDetectChar_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</DetectChar>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '/', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDynamic1 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, undef, 0, '#pop', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDynamic2 {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '%1', 0, 1, 0, undef, 0, '#pop', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDynamic3 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '1', 0, 1, 0, undef, 0, '#pop', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDynamic4 {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '1', '2', 0, 1, 0, undef, 0, '#pop', 'Match')) {
		return 1
	}
	return 0;
};

sub parseDynamic_2Chars_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Dyn2Chars>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\d)(\\d)', 0, 0, 1, undef, 0, 'Dynamic4', 'Match2')) {
		return 1
	}
	return 0;
};

sub parseDynamic_Char_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</DynChar>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\d)', 0, 0, 1, undef, 0, 'Dynamic3', 'Match2')) {
		return 1
	}
	return 0;
};

sub parseDynamic_Reg_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</DynReg>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<switch>)', 0, 0, 1, undef, 0, 'Dynamic1', 'Match2')) {
		return 1
	}
	return 0;
};

sub parseDynamic_String_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</DynString>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<switch2>)', 0, 0, 1, undef, 0, 'Dynamic2', 'Match2')) {
		return 1
	}
	return 0;
};

sub parseFirstNonSpace_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</FirstNonSpace>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '.', 0, 0, 0, undef, 1, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseFloat_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Float>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseHlCChar_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</HlCChar>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseHlCHex_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</HlCHex>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => HlCHex
	if ($self->testHlCHex($text, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseHlCOct_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</HlCOct>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => HlCOct
	if ($self->testHlCOct($text, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseHlCStringChar_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</HlCStringChar>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => HlCStringChar
	if ($self->testHlCStringChar($text, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseIncludeModule_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</IncludeModule>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('BaseTestchild', $text)) {
		return 1
	}
	return 0;
};

sub parseIncludeRules_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</IncludeRules>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	return 0;
};

sub parseInt_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Int>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseLineContinue_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</LineContinue>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseMinimal_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</Minimal>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '".*?"', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseRangeDetect_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</RangeDetect>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, 'a', 'd', 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseRegExpr_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</RegExpr>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\d', 0, 0, 0, undef, 0, '#stay', 'Match2')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<\\d+>', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '^<over>', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<out>', 1, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parseStringDetect_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</StringDetect>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, 'der', 0, 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};

sub parsekeyword_T {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('Comment_T2', $text)) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '</keyword>', 0, 0, 0, undef, 0, '#pop', 'Test Area')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'shortwords', 0, 0, undef, 0, '#stay', 'Match')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::BaseTest - a Plugin for BaseTest syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::BaseTest;
 my $sh = new Syntax::Highlight::Engine::Kate::BaseTest([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::BaseTest is a  plugin module that provides syntax highlighting
for BaseTest to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

