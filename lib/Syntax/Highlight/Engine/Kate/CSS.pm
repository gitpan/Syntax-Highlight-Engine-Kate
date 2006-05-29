# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/css.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.99
#kate version 2.4
#kate author Wilbert Berendsen (wilbert@kde.nl)
#generated: Sun May 28 21:18:27 2006, localtime

package Syntax::Highlight::Engine::Kate::CSS;

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
		'At Rule' => 'DecVal',
		'Comment' => 'Comment',
		'Error' => 'Error',
		'Important' => 'Keyword',
		'Media' => 'Others',
		'Normal Text' => 'Normal',
		'Property' => 'Keyword',
		'Region Marker' => 'RegionMarker',
		'Selector Attr' => 'Char',
		'Selector Class' => 'Float',
		'Selector Id' => 'BaseN',
		'Selector Pseudo' => 'DecVal',
		'String' => 'String',
		'Unknown Property' => 'Error',
		'Value' => 'DataType',
	});
	$self->listAdd('colors',
		'ActiveBorder',
		'ActiveCaption',
		'AppWorkspace',
		'Background',
		'ButtonFace',
		'ButtonHighlight',
		'ButtonShadow',
		'ButtonText',
		'CaptionText',
		'GrayText',
		'Highlight',
		'HighlightText',
		'InactiveBorder',
		'InactiveCaption',
		'InactiveCaptionText',
		'InfoBackground',
		'InfoText',
		'Menu',
		'MenuText',
		'Scrollbar',
		'ThreeDDarkShadow',
		'ThreeDFace',
		'ThreeDHighlight',
		'ThreeDLightShadow',
		'ThreeDShadow',
		'Window',
		'WindowFrame',
		'WindowText',
		'aqua',
		'black',
		'blue',
		'fuchsia',
		'gray',
		'green',
		'lime',
		'maroon',
		'navy',
		'olive',
		'purple',
		'red',
		'silver',
		'teal',
		'white',
		'yellow',
	);
	$self->listAdd('mediatypes',
		'all',
		'aural',
		'braille',
		'embossed',
		'handheld',
		'print',
		'projection',
		'screen',
		'tty',
		'tv',
	);
	$self->listAdd('paren',
		'attr',
		'counter',
		'counters',
		'format',
		'local',
		'rect',
		'rgb',
		'url',
	);
	$self->listAdd('properties',
		'ascent',
		'azimuth',
		'background',
		'background-attachment',
		'background-color',
		'background-image',
		'background-position',
		'background-repeat',
		'baseline',
		'bbox',
		'border',
		'border-bottom',
		'border-bottom-color',
		'border-bottom-style',
		'border-bottom-width',
		'border-collapse',
		'border-color',
		'border-left',
		'border-left-color',
		'border-left-style',
		'border-left-width',
		'border-right',
		'border-right-color',
		'border-right-style',
		'border-right-width',
		'border-spacing',
		'border-style',
		'border-top',
		'border-top-color',
		'border-top-style',
		'border-top-width',
		'border-width',
		'bottom',
		'box-sizing',
		'cap-height',
		'caption-side',
		'centerline',
		'clear',
		'clip',
		'color',
		'content',
		'counter-increment',
		'counter-reset',
		'cue',
		'cue-after',
		'cue-before',
		'cursor',
		'definition-src',
		'descent',
		'direction',
		'display',
		'elevation',
		'empty-cells',
		'float',
		'font',
		'font-family',
		'font-family',
		'font-size',
		'font-size',
		'font-size-adjust',
		'font-stretch',
		'font-stretch',
		'font-style',
		'font-style',
		'font-variant',
		'font-variant',
		'font-weight',
		'font-weight',
		'height',
		'konq_bgpos_x',
		'konq_bgpos_y',
		'left',
		'letter-spacing',
		'line-height',
		'list-style',
		'list-style-image',
		'list-style-keyword',
		'list-style-position',
		'list-style-type',
		'margin',
		'margin-bottom',
		'margin-left',
		'margin-right',
		'margin-top',
		'marker-offset',
		'mathline',
		'max-height',
		'max-width',
		'min-height',
		'min-width',
		'opacity',
		'orphans',
		'outline',
		'outline-color',
		'outline-style',
		'outline-width',
		'overflow',
		'padding',
		'padding-bottom',
		'padding-left',
		'padding-right',
		'padding-top',
		'page',
		'page-break-after',
		'page-break-before',
		'page-break-inside',
		'panose-1',
		'pause',
		'pause-after',
		'pause-before',
		'pitch',
		'pitch-range',
		'play-during',
		'position',
		'quotes',
		'richness',
		'right',
		'size',
		'slope',
		'speak',
		'speak-header',
		'speak-numeral',
		'speak-punctuation',
		'speech-rate',
		'src',
		'stemh',
		'stemv',
		'stress',
		'table-layout',
		'text-align',
		'text-decoration',
		'text-decoration-color',
		'text-indent',
		'text-shadow',
		'text-shadow',
		'text-transform',
		'top',
		'topline',
		'unicode-bidi',
		'unicode-range',
		'units-per-em',
		'vertical-align',
		'visibility',
		'voice-family',
		'volume',
		'white-space',
		'widows',
		'width',
		'widths',
		'word-spacing',
		'x-height',
		'z-index',
	);
	$self->listAdd('pseudoclasses',
		'active',
		'after',
		'before',
		'checked',
		'disabled',
		'empty',
		'enabled',
		'first-child',
		'first-letter',
		'first-line',
		'first-of-type',
		'focus',
		'hover',
		'indeterminate',
		'last-child',
		'last-of-type',
		'link',
		'only-child',
		'only-of-type',
		'root',
		'selection',
		'target',
		'visited',
	);
	$self->listAdd('types',
		'100',
		'200',
		'300',
		'400',
		'500',
		'600',
		'700',
		'800',
		'900',
		'above',
		'absolute',
		'always',
		'armenian',
		'auto',
		'avoid',
		'baseline',
		'below',
		'bidi-override',
		'blink',
		'block',
		'bold',
		'bolder',
		'border-box',
		'both',
		'bottom',
		'box',
		'break',
		'capitalize',
		'caption',
		'center',
		'circle',
		'cjk-ideographic',
		'close-quote',
		'collapse',
		'compact',
		'condensed',
		'content-box',
		'crop',
		'cross',
		'crosshair',
		'cursive',
		'dashed',
		'decimal',
		'decimal-leading-zero',
		'default',
		'disc',
		'dotted',
		'double',
		'e-resize',
		'embed',
		'expanded',
		'extra-condensed',
		'extra-expanded',
		'fantasy',
		'fixed',
		'georgian',
		'groove',
		'hand',
		'hebrew',
		'help',
		'hidden',
		'hide',
		'higher',
		'hiragana',
		'hiragana-iroha',
		'icon',
		'inherit',
		'inline',
		'inline-table',
		'inset',
		'inside',
		'invert',
		'italic',
		'justify',
		'katakana',
		'katakana-iroha',
		'konq-center',
		'landscape',
		'large',
		'larger',
		'left',
		'level',
		'light',
		'lighter',
		'line-through',
		'list-item',
		'loud',
		'lower',
		'lower-alpha',
		'lower-greek',
		'lower-latin',
		'lower-roman',
		'lowercase',
		'ltr',
		'marker',
		'medium',
		'menu',
		'message-box',
		'middle',
		'mix',
		'monospace',
		'move',
		'n-resize',
		'narrower',
		'ne-resize',
		'no-close-quote',
		'no-open-quote',
		'no-repeat',
		'none',
		'normal',
		'nowrap',
		'nw-resize',
		'oblique',
		'open-quote',
		'outset',
		'outside',
		'overline',
		'pointer',
		'portrait',
		'pre',
		'pre-line',
		'pre-wrap',
		'relative',
		'repeat',
		'repeat-x',
		'repeat-y',
		'ridge',
		'right',
		'rtl',
		'run-in',
		's-resize',
		'sans-serif',
		'scroll',
		'se-resize',
		'semi-condensed',
		'semi-expanded',
		'separate',
		'serif',
		'show',
		'small',
		'small-caps',
		'small-caption',
		'smaller',
		'solid',
		'square',
		'static',
		'static-position',
		'status-bar',
		'sub',
		'super',
		'sw-resize',
		'table',
		'table-caption',
		'table-cell',
		'table-column',
		'table-column-group',
		'table-footer-group',
		'table-header-group',
		'table-row',
		'table-row-group',
		'text',
		'text-bottom',
		'text-top',
		'thick',
		'thin',
		'top',
		'transparent',
		'ultra-condensed',
		'ultra-expanded',
		'underline',
		'upper-alpha',
		'upper-latin',
		'upper-roman',
		'uppercase',
		'visible',
		'w-resize',
		'wait',
		'wider',
		'x-large',
		'x-small',
		'xx-large',
		'xx-small',
	);
	$self->contextdata({
		'Base' => {
			callback => \&parseBase,
			attribute => 'Normal Text',
		},
		'Comment' => {
			callback => \&parseComment,
			attribute => 'Comment',
		},
		'FindComments' => {
			callback => \&parseFindComments,
			attribute => 'Normal Text',
		},
		'FindRuleSets' => {
			callback => \&parseFindRuleSets,
			attribute => 'Normal Text',
		},
		'FindStrings' => {
			callback => \&parseFindStrings,
			attribute => 'Normal Text',
		},
		'FindValues' => {
			callback => \&parseFindValues,
			attribute => 'Normal Text',
		},
		'Import' => {
			callback => \&parseImport,
			attribute => 'Normal Text',
		},
		'InsideString' => {
			callback => \&parseInsideString,
			attribute => 'String',
		},
		'Media' => {
			callback => \&parseMedia,
			attribute => 'Normal Text',
		},
		'Media2' => {
			callback => \&parseMedia2,
			attribute => 'Normal Text',
		},
		'PropParen' => {
			callback => \&parsePropParen,
			attribute => 'Normal Text',
		},
		'PropParen2' => {
			callback => \&parsePropParen2,
			attribute => 'Normal Text',
		},
		'Rule' => {
			callback => \&parseRule,
			attribute => 'Normal Text',
		},
		'Rule2' => {
			callback => \&parseRule2,
			attribute => 'Normal Text',
		},
		'RuleSet' => {
			callback => \&parseRuleSet,
			attribute => 'Normal Text',
		},
		'SelAttr' => {
			callback => \&parseSelAttr,
			attribute => 'Selector Attr',
		},
		'SelPseudo' => {
			callback => \&parseSelPseudo,
			attribute => 'Selector Pseudo',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'StringDQ' => {
			callback => \&parseStringDQ,
			attribute => 'String',
		},
		'StringSQ' => {
			callback => \&parseStringSQ,
			attribute => 'String',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|<|=|>|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Base');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'CSS';
}

sub parseBase {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindRuleSets', $text)) {
		return 1
	}
	return 0;
};

sub parseComment {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	return 0;
};

sub parseFindComments {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '/\\*BEGIN.*\\*/', 0, 0, 0, undef, 0, '#stay', 'Region Marker')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '/\\*END.*\\*/', 0, 0, 0, undef, 0, '#stay', 'Region Marker')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseFindRuleSets {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '@media\\b', 0, 0, 0, undef, 0, 'Media', 'Media')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '@import\\b', 0, 0, 0, undef, 0, 'Import', 'At Rule')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '@(font-face|charset)\\b', 0, 0, 0, undef, 0, '#stay', 'At Rule')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'RuleSet', 'Property')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'SelAttr', 'Selector Attr')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#[A-Za-z0-9][\\w\\-]*', 0, 0, 0, undef, 0, '#stay', 'Selector Id')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.[A-Za-z0-9][\\w\\-]*', 0, 0, 0, undef, 0, '#stay', 'Selector Class')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ':lang\\([\\w_-]+\\)', 0, 0, 0, undef, 0, '#stay', 'Selector Pseudo')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ':', 0, 0, 0, undef, 0, 'SelPseudo', 'Selector Pseudo')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	return 0;
};

sub parseFindStrings {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'StringDQ', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'StringSQ', 'String')) {
		return 1
	}
	return 0;
};

sub parseFindValues {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[-+]?[0-9.]+(em|ex|px|in|cm|mm|pt|pc|deg|rad|grad|ms|s|Hz|kHz)\\b', 0, 0, 0, undef, 0, '#stay', 'Value')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[-+]?[0-9.]+[%]?', 0, 0, 0, undef, 0, '#stay', 'Value')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\w\\-]+', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseImport {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, '#pop', 'At Rule')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'mediatypes', 0, 0, undef, 0, '#stay', 'Media')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindValues', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	return 0;
};

sub parseInsideString {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\["\']', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	return 0;
};

sub parseMedia {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'Media2', 'Media')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'mediatypes', 0, 0, undef, 0, '#stay', 'Media')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ',', 0, 0, 0, undef, 0, '#stay', 'Media')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S+', 0, 0, 0, undef, 0, '#stay', 'Error')) {
		return 1
	}
	return 0;
};

sub parseMedia2 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'Media')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindRuleSets', $text)) {
		return 1
	}
	return 0;
};

sub parsePropParen {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'PropParen2', 'Value')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S', 0, 0, 0, undef, 0, '#stay', 'Error')) {
		return 1
	}
	return 0;
};

sub parsePropParen2 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop', 'Value')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindValues', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	return 0;
};

sub parseRule {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ':', 0, 0, 0, undef, 0, 'Rule2', 'Property')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S', 0, 0, 0, undef, 0, '#stay', 'Error')) {
		return 1
	}
	return 0;
};

sub parseRule2 {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ';', 0, 0, 0, undef, 0, '#pop#pop', 'Property')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Property')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Value')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'colors', 0, 0, undef, 0, '#stay', 'Value')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#([0-9A-Fa-f]{3}){1,4}\\b', 0, 0, 0, undef, 0, '#stay', 'Value')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'paren', 0, 0, undef, 0, 'PropParen', 'Value')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '!important\\b', 0, 0, 0, undef, 0, '#stay', 'Important')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindValues', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	return 0;
};

sub parseRuleSet {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Property')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'properties', 0, 0, undef, 0, 'Rule', 'Property')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '-?[A-Za-z_-]+(?=\\s*:)', 0, 0, 0, undef, 0, 'Rule', 'Unknown Property')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\S', 0, 0, 0, undef, 0, '#stay', 'Error')) {
		return 1
	}
	return 0;
};

sub parseSelAttr {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Selector Attr')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	return 0;
};

sub parseSelPseudo {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'pseudoclasses', 0, 0, undef, 0, '#pop', 'Selector Pseudo')) {
		return 1
	}
	return 0;
};

sub parseStringDQ {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('InsideString', $text)) {
		return 1
	}
	return 0;
};

sub parseStringSQ {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('InsideString', $text)) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::CSS - a Plugin for CSS syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::CSS;
 my $sh = new Syntax::Highlight::Engine::Kate::CSS([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::CSS is a  plugin module that provides syntax highlighting
for CSS to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

