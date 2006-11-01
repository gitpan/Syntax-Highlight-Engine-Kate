# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/verilog.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.07
#kate version 2.4
#kate author Yevgen Voronenko (ysv22@drexel.edu)
#generated: Wed Nov  1 21:17:54 2006, localtime

package Syntax::Highlight::Engine::Kate::Verilog;

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
		'Binary' => 'BaseN',
		'Block name' => 'DataType',
		'Comment' => 'Comment',
		'Data Type' => 'DataType',
		'Decimal' => 'BaseN',
		'Delay' => 'BaseN',
		'Drive/charge strength' => 'BaseN',
		'Float' => 'Float',
		'Gate instantiation' => 'DataType',
		'Hex' => 'BaseN',
		'Integer' => 'DecVal',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Port connection' => 'DataType',
		'Prep. Lib' => 'Float',
		'Preprocessor' => 'Others',
		'String' => 'String',
		'String Char' => 'Char',
		'Symbol' => 'Normal',
		'System Task' => 'DataType',
	});
	$self->listAdd('gates',
		'and',
		'buf',
		'bufif0',
		'bufif1',
		'cmos',
		'nand',
		'nmos',
		'nor',
		'not',
		'notif0',
		'notif1',
		'or',
		'pmos',
		'pulldown',
		'pullup',
		'rcmos',
		'rnmos',
		'rpmos',
		'rtran',
		'rtranif0',
		'rtranif1',
		'tran',
		'tranif0',
		'tranif1',
		'xnor',
		'xor',
	);
	$self->listAdd('keywords',
		'always',
		'assign',
		'begin',
		'case',
		'casex',
		'casez',
		'deassign',
		'default',
		'defparam',
		'disable',
		'edge',
		'else',
		'end',
		'endcase',
		'endfunction',
		'endmodule',
		'endspecify',
		'endtable',
		'endtask',
		'for',
		'force',
		'forever',
		'fork',
		'function',
		'if',
		'ifnone',
		'initial',
		'join',
		'macromodule',
		'module',
		'negedge',
		'posedge',
		'release',
		'repeat',
		'specify',
		'specparam',
		'table',
		'task',
		'wait',
		'while',
	);
	$self->listAdd('strength',
		'highz0',
		'highz1',
		'large',
		'medium',
		'pull0',
		'pull1',
		'small',
		'strong0',
		'strong1',
		'weak0',
		'weak1',
	);
	$self->listAdd('types',
		'event',
		'inout',
		'input',
		'integer',
		'output',
		'parameter',
		'real',
		'realtime',
		'reg',
		'scalared',
		'supply0',
		'supply1',
		'time',
		'tri',
		'tri0',
		'tri1',
		'triand',
		'trior',
		'trireg',
		'vectored',
		'wand',
		'wire',
		'wor',
	);
	$self->contextdata({
		'Block name' => {
			callback => \&parseBlockname,
			attribute => 'Block name',
			lineending => '#pop',
		},
		'Commentar 1' => {
			callback => \&parseCommentar1,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Commentar 2' => {
			callback => \&parseCommentar2,
			attribute => 'Comment',
		},
		'Commentar/Preprocessor' => {
			callback => \&parseCommentarPreprocessor,
			attribute => 'Comment',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'Preprocessor' => {
			callback => \&parsePreprocessor,
			attribute => 'Preprocessor',
			lineending => '#pop',
		},
		'Some Context' => {
			callback => \&parseSomeContext,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'Some Context2' => {
			callback => \&parseSomeContext2,
			attribute => 'Comment',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
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
	return 'Verilog';
}

sub parseBlockname {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[^ ]+', 0, 0, 0, undef, 0, '#pop', 'Data Type')) {
		return 1
	}
	return 0;
};

sub parseCommentar1 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseCommentar2 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseCommentarPreprocessor {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '*', '/', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, 'begin\\ *:', 0, 0, 0, undef, 0, 'Block name', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'types', 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'strength', 0, 0, undef, 0, '#stay', 'Drive/charge strength')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'gates', 0, 0, undef, 0, '#stay', 'Gate instantiation')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[a-zA-Z]+[\\w$]*', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[^ ]+ ', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\d_]*\'d[\\d_]+', 0, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\d_]*\'o[0-7xXzZ_]+', 0, 0, 0, undef, 0, '#stay', 'Octal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\d_]*\'h[\\da-fA-FxXzZ_]+', 0, 0, 0, undef, 0, '#stay', 'Hex')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\d_]*\'b[01_zZxX]+', 0, 0, 0, undef, 0, '#stay', 'Binary')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, '#stay', 'Integer')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^\\w$]\\.[a-zA-Z]+[\\w$]*', 0, 0, 0, undef, 0, '#stay', 'Port connection')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'String', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Commentar 1', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Commentar 2', 'Comment')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '!%&()+,-<=+/:;>?[]^{|}~@', 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#if 0', 0, 0, 0, undef, 1, 'Some Context2', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, 0, 0, 'Preprocessor', 'Preprocessor')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\`[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, '#stay', 'Preprocessor')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[a-zA-Z_]+\\w*', 0, 0, 0, undef, 0, '#stay', 'System Task')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#[\\d_]+', 0, 0, 0, undef, 0, '#stay', 'Delay')) {
		return 1
	}
	return 0;
};

sub parsePreprocessor {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, 'Some Context', 'Preprocessor')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '"', '"', 0, 0, undef, 0, '#stay', 'Prep. Lib')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '<', '>', 0, 0, undef, 0, '#stay', 'Prep. Lib')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '/', 0, 0, 0, undef, 0, 'Commentar 1', 'Comment')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '/', '*', 0, 0, 0, undef, 0, 'Commentar/Preprocessor', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseSomeContext {
	my ($self, $text) = @_;
	return 0;
};

sub parseSomeContext2 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(FIXME|TODO)', 0, 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '#endif', 0, 0, 0, undef, 1, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, 'Some Context', 'String')) {
		return 1
	}
	# type => HlCStringChar
	if ($self->testHlCStringChar($text, 0, undef, 0, '#stay', 'String Char')) {
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

Syntax::Highlight::Engine::Kate::Verilog - a Plugin for Verilog syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Verilog;
 my $sh = new Syntax::Highlight::Engine::Kate::Verilog([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Verilog is a  plugin module that provides syntax highlighting
for Verilog to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

