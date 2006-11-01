# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/lua.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 0.22
#kate version 2.3
#generated: Wed Nov  1 21:17:49 2006, localtime

package Syntax::Highlight::Engine::Kate::Lua;

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
		'Alert' => 'Alert',
		'BaseFunc' => 'Reserved',
		'Comment' => 'Comment',
		'Decimal' => 'DecVal',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Number' => 'BaseN',
		'String' => 'String',
		'Symbol' => 'Normal',
	});
	$self->listAdd('basefunc',
		'LUA_PATH',
		'_ALERT',
		'_ERRORMESSAGE',
		'_LOADED',
		'_VERSION',
		'abs',
		'acos',
		'appendto',
		'ascii',
		'asin',
		'assert',
		'atan',
		'atan2',
		'call',
		'ceil',
		'clock',
		'closefile',
		'collectgarbage',
		'copytagmethods',
		'cos',
		'date',
		'debug.gethook',
		'debug.getinfo',
		'debug.getlocal',
		'debug.sethook',
		'debug.setlocal',
		'deg',
		'dofile',
		'dostring',
		'error',
		'execute',
		'exit',
		'exp',
		'floor',
		'flush',
		'foreach',
		'foreachi',
		'format',
		'frexp',
		'gcinfo',
		'getenv',
		'getglobal',
		'getglobals',
		'getinfo',
		'getlocal',
		'getmetatable',
		'getn',
		'gettagmethod',
		'globals',
		'gsub',
		'io.close',
		'io.flush',
		'io.input',
		'io.lines',
		'io.open',
		'io.output',
		'io.read',
		'io.stderr',
		'io.stdin',
		'io.stdout',
		'io.tmpfile',
		'io.write',
		'ipairs',
		'ldexp',
		'loadfile',
		'loadstring',
		'log',
		'log10',
		'math.abs',
		'math.acos',
		'math.asin',
		'math.atan',
		'math.atan2',
		'math.ceil',
		'math.cos',
		'math.deg',
		'math.exp',
		'math.floor',
		'math.frexp',
		'math.ldexp',
		'math.log',
		'math.log10',
		'math.max',
		'math.min',
		'math.mod',
		'math.rad',
		'math.random',
		'math.randomseed',
		'math.sin',
		'math.squrt',
		'math.tan',
		'max',
		'min',
		'mod',
		'newtag',
		'next',
		'openfile',
		'os.clock',
		'os.date',
		'os.difftime',
		'os.execute',
		'os.exit',
		'os.getenv',
		'os.remove',
		'os.rename',
		'os.setlocale',
		'os.time',
		'os.tmpname',
		'pairs',
		'pcall',
		'print',
		'rad',
		'random',
		'randomseed',
		'rawget',
		'rawset',
		'read',
		'readfrom',
		'remove',
		'rename',
		'require',
		'seek',
		'setcallhook',
		'setglobal',
		'setglobals',
		'setlinehook',
		'setlocal',
		'setlocale',
		'setmetatable',
		'settag',
		'settagmethod',
		'sin',
		'sort',
		'squrt',
		'strbyte',
		'strchar',
		'strfind',
		'string.byte',
		'string.char',
		'string.find',
		'string.format',
		'string.gfind',
		'string.gsub',
		'string.len',
		'string.lower',
		'string.rep',
		'string.sub',
		'string.upper',
		'strlen',
		'strlower',
		'strrep',
		'strsub',
		'strupper',
		'table.concat',
		'table.foreach',
		'table.foreachi',
		'table.getn',
		'table.insert',
		'table.remove',
		'table.setn',
		'table.sort',
		'tag',
		'tan',
		'tinsert',
		'tmpname',
		'tonumber',
		'tostring',
		'tremove',
		'type',
		'unpack',
		'write',
		'writeto',
	);
	$self->listAdd('keywords',
		'and',
		'break',
		'do',
		'else',
		'elsif',
		'end',
		'for',
		'function',
		'if',
		'in',
		'local',
		'nil',
		'not',
		'or',
		'repeat',
		'return',
		'then',
		'until',
		'while',
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
		'String' => {
			callback => \&parseString,
			attribute => 'String',
			lineending => '#pop',
		},
	});
	$self->deliminators('\\s||\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\|"');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Lua';
}

sub parseComment {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'basefunc', 0, 0, undef, 0, '#stay', 'BaseFunc')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '-', '-', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 0, 'Comment', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '!%&()+,-<=>?[]^{|}~', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\d*\\.?\\d*e?\\d+', 0, 0, 0, undef, 0, '#stay', 'Number')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Lua - a Plugin for Lua syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Lua;
 my $sh = new Syntax::Highlight::Engine::Kate::Lua([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Lua is a  plugin module that provides syntax highlighting
for Lua to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

