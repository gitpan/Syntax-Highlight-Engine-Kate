# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/ruby.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.16
#kate version 2.4
#kate author Stefan Lang (langstefan@gmx.at), Sebastian Vuorinen (sebastian.vuorinen@helsinki.fi)
#generated: Wed Nov  1 21:17:53 2006, localtime

package Syntax::Highlight::Engine::Kate::Ruby;

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
		'Access Control' => 'Keyword',
		'Alert' => 'Alert',
		'Attribute Definition' => 'Others',
		'Bin' => 'BaseN',
		'Blockcomment' => 'Comment',
		'Char' => 'Char',
		'Class Variable' => 'Others',
		'Command' => 'String',
		'Comment' => 'Comment',
		'Constant' => 'DataType',
		'Constant Value' => 'DataType',
		'Data' => 'Normal',
		'Dec' => 'DecVal',
		'Default globals' => 'DataType',
		'Definition' => 'Keyword',
		'Delimiter' => 'Char',
		'Error' => 'Error',
		'Expression' => 'Others',
		'Float' => 'Float',
		'GDL input' => 'Others',
		'Global Constant' => 'DataType',
		'Global Variable' => 'DataType',
		'Hex' => 'BaseN',
		'Instance Variable' => 'Others',
		'Kernel methods' => 'Normal',
		'Keyword' => 'Keyword',
		'Member' => 'Normal',
		'Message' => 'Normal',
		'Normal Text' => 'Normal',
		'Octal' => 'BaseN',
		'Operator' => 'Char',
		'Pseudo variable' => 'DecVal',
		'RDoc Value' => 'Others',
		'Raw String' => 'String',
		'Region Marker' => 'Normal',
		'Regular Expression' => 'Others',
		'String' => 'String',
		'Substitution' => 'Others',
		'Symbol' => 'String',
	});
	$self->listAdd('access-control',
		'private',
		'private_class_method',
		'protected',
		'public',
		'public_class_method',
	);
	$self->listAdd('attention',
		'FIXME',
		'NOTE',
		'TODO',
	);
	$self->listAdd('attribute-definitions',
		'attr_accessor',
		'attr_reader',
		'attr_writer',
	);
	$self->listAdd('default-globals',
		'$deferr',
		'$defout',
		'$stderr',
		'$stdin',
		'$stdout',
	);
	$self->listAdd('definitions',
		'alias',
		'class',
		'def',
		'module',
		'undef',
	);
	$self->listAdd('kernel-methods',
		'abort',
		'at_exit',
		'autoload',
		'autoload?',
		'binding',
		'block_given?',
		'callcc',
		'caller',
		'catch',
		'chomp',
		'chomp!',
		'chop',
		'chop!',
		'eval',
		'exec',
		'exit',
		'exit!',
		'fail',
		'fork',
		'format',
		'getc',
		'gets',
		'global_variables',
		'gsub',
		'gsub!',
		'iterator?',
		'lambda',
		'load',
		'local_variables',
		'loop',
		'method_missing',
		'open',
		'p',
		'print',
		'printf',
		'proc',
		'putc',
		'puts',
		'raise',
		'rand',
		'readline',
		'readlines',
		'require',
		'scan',
		'select',
		'set_trace_func',
		'sleep',
		'split',
		'sprintf',
		'srand',
		'sub',
		'sub!',
		'syscall',
		'system',
		'test',
		'throw',
		'trace_var',
		'trap',
		'untrace_var',
		'warn',
	);
	$self->listAdd('keywords',
		'BEGIN',
		'END',
		'and',
		'begin',
		'break',
		'case',
		'defined?',
		'do',
		'else',
		'elsif',
		'end',
		'ensure',
		'for',
		'if',
		'in',
		'include',
		'next',
		'not',
		'or',
		'redo',
		'rescue',
		'retry',
		'return',
		'then',
		'unless',
		'until',
		'when',
		'while',
		'yield',
	);
	$self->listAdd('pseudo-variables',
		'__FILE__',
		'__LINE__',
		'caller',
		'false',
		'nil',
		'self',
		'super',
		'true',
	);
	$self->contextdata({
		'Apostrophed String' => {
			callback => \&parseApostrophedString,
			attribute => 'Raw String',
		},
		'Command String' => {
			callback => \&parseCommandString,
			attribute => 'Command',
		},
		'Comment Line' => {
			callback => \&parseCommentLine,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'DATA' => {
			callback => \&parseDATA,
			attribute => 'Data',
		},
		'Embedded documentation' => {
			callback => \&parseEmbeddeddocumentation,
			attribute => 'Comment',
		},
		'General Comment' => {
			callback => \&parseGeneralComment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'Line Continue' => {
			callback => \&parseLineContinue,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'Member Access' => {
			callback => \&parseMemberAccess,
			attribute => 'Member',
			lineending => '#pop',
		},
		'Normal' => {
			callback => \&parseNormal,
			attribute => 'Normal Text',
		},
		'Quoted String' => {
			callback => \&parseQuotedString,
			attribute => 'String',
		},
		'RDoc Label' => {
			callback => \&parseRDocLabel,
			attribute => 'RDoc Value',
			lineending => '#pop',
		},
		'RegEx 1' => {
			callback => \&parseRegEx1,
			attribute => 'Regular Expression',
		},
		'Short Subst' => {
			callback => \&parseShortSubst,
			attribute => 'Substitution',
			lineending => '#pop',
		},
		'Subst' => {
			callback => \&parseSubst,
			attribute => 'Normal Text',
		},
		'apostrophed_indented_heredoc' => {
			callback => \&parseapostrophed_indented_heredoc,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'apostrophed_normal_heredoc' => {
			callback => \&parseapostrophed_normal_heredoc,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'apostrophed_rules' => {
			callback => \&parseapostrophed_rules,
			attribute => 'Raw String',
		},
		'dq_string_rules' => {
			callback => \&parsedq_string_rules,
			attribute => 'String',
		},
		'find_gdl_input' => {
			callback => \&parsefind_gdl_input,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'find_heredoc' => {
			callback => \&parsefind_heredoc,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'find_indented_heredoc' => {
			callback => \&parsefind_indented_heredoc,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'gdl_apostrophed_1' => {
			callback => \&parsegdl_apostrophed_1,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_1_nested' => {
			callback => \&parsegdl_apostrophed_1_nested,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_2' => {
			callback => \&parsegdl_apostrophed_2,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_2_nested' => {
			callback => \&parsegdl_apostrophed_2_nested,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_3' => {
			callback => \&parsegdl_apostrophed_3,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_3_nested' => {
			callback => \&parsegdl_apostrophed_3_nested,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_4' => {
			callback => \&parsegdl_apostrophed_4,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_4_nested' => {
			callback => \&parsegdl_apostrophed_4_nested,
			attribute => 'Raw String',
		},
		'gdl_apostrophed_5' => {
			callback => \&parsegdl_apostrophed_5,
			attribute => 'Raw String',
			dynamic => 1,
		},
		'gdl_dq_string_1' => {
			callback => \&parsegdl_dq_string_1,
			attribute => 'String',
		},
		'gdl_dq_string_1_nested' => {
			callback => \&parsegdl_dq_string_1_nested,
			attribute => 'String',
		},
		'gdl_dq_string_2' => {
			callback => \&parsegdl_dq_string_2,
			attribute => 'String',
		},
		'gdl_dq_string_2_nested' => {
			callback => \&parsegdl_dq_string_2_nested,
			attribute => 'String',
		},
		'gdl_dq_string_3' => {
			callback => \&parsegdl_dq_string_3,
			attribute => 'String',
		},
		'gdl_dq_string_3_nested' => {
			callback => \&parsegdl_dq_string_3_nested,
			attribute => 'String',
		},
		'gdl_dq_string_4' => {
			callback => \&parsegdl_dq_string_4,
			attribute => 'String',
		},
		'gdl_dq_string_4_nested' => {
			callback => \&parsegdl_dq_string_4_nested,
			attribute => 'String',
		},
		'gdl_dq_string_5' => {
			callback => \&parsegdl_dq_string_5,
			attribute => 'String',
			dynamic => 1,
		},
		'gdl_regexpr_1' => {
			callback => \&parsegdl_regexpr_1,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_1_nested' => {
			callback => \&parsegdl_regexpr_1_nested,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_2' => {
			callback => \&parsegdl_regexpr_2,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_2_nested' => {
			callback => \&parsegdl_regexpr_2_nested,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_3' => {
			callback => \&parsegdl_regexpr_3,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_3_nested' => {
			callback => \&parsegdl_regexpr_3_nested,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_4' => {
			callback => \&parsegdl_regexpr_4,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_4_nested' => {
			callback => \&parsegdl_regexpr_4_nested,
			attribute => 'Regular Expression',
		},
		'gdl_regexpr_5' => {
			callback => \&parsegdl_regexpr_5,
			attribute => 'Regular Expression',
			dynamic => 1,
		},
		'gdl_shell_command_1' => {
			callback => \&parsegdl_shell_command_1,
			attribute => 'Command',
		},
		'gdl_shell_command_1_nested' => {
			callback => \&parsegdl_shell_command_1_nested,
			attribute => 'Command',
		},
		'gdl_shell_command_2' => {
			callback => \&parsegdl_shell_command_2,
			attribute => 'Command',
		},
		'gdl_shell_command_2_nested' => {
			callback => \&parsegdl_shell_command_2_nested,
			attribute => 'Command',
		},
		'gdl_shell_command_3' => {
			callback => \&parsegdl_shell_command_3,
			attribute => 'Command',
		},
		'gdl_shell_command_3_nested' => {
			callback => \&parsegdl_shell_command_3_nested,
			attribute => 'Command',
		},
		'gdl_shell_command_4' => {
			callback => \&parsegdl_shell_command_4,
			attribute => 'Command',
		},
		'gdl_shell_command_4_nested' => {
			callback => \&parsegdl_shell_command_4_nested,
			attribute => 'Command',
		},
		'gdl_shell_command_5' => {
			callback => \&parsegdl_shell_command_5,
			attribute => 'Command',
			dynamic => 1,
		},
		'gdl_token_array_1' => {
			callback => \&parsegdl_token_array_1,
			attribute => 'String',
		},
		'gdl_token_array_1_nested' => {
			callback => \&parsegdl_token_array_1_nested,
			attribute => 'String',
		},
		'gdl_token_array_2' => {
			callback => \&parsegdl_token_array_2,
			attribute => 'String',
		},
		'gdl_token_array_2_nested' => {
			callback => \&parsegdl_token_array_2_nested,
			attribute => 'String',
		},
		'gdl_token_array_3' => {
			callback => \&parsegdl_token_array_3,
			attribute => 'String',
		},
		'gdl_token_array_3_nested' => {
			callback => \&parsegdl_token_array_3_nested,
			attribute => 'String',
		},
		'gdl_token_array_4' => {
			callback => \&parsegdl_token_array_4,
			attribute => 'String',
		},
		'gdl_token_array_4_nested' => {
			callback => \&parsegdl_token_array_4_nested,
			attribute => 'String',
		},
		'gdl_token_array_5' => {
			callback => \&parsegdl_token_array_5,
			attribute => 'String',
			dynamic => 1,
		},
		'heredoc_rules' => {
			callback => \&parseheredoc_rules,
			attribute => 'Normal Text',
		},
		'indented_heredoc' => {
			callback => \&parseindented_heredoc,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'normal_heredoc' => {
			callback => \&parsenormal_heredoc,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'regexpr_rules' => {
			callback => \&parseregexpr_rules,
			attribute => 'Regular Expression',
		},
		'shell_command_rules' => {
			callback => \&parseshell_command_rules,
			attribute => 'Command',
		},
		'token_array_rules' => {
			callback => \&parsetoken_array_rules,
			attribute => 'String',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Ruby';
}

sub parseApostrophedString {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '\\\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\\\\'', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parseCommandString {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '\\\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\\\`', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#pop', 'Char')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, '#pop', 'Command')) {
		return 1
	}
	return 0;
};

sub parseCommentLine {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\w\\:\\:\\s', 0, 0, 0, undef, 0, 'RDoc Label', 'Comment')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'attention', 0, 0, undef, 0, '#stay', 'Alert')) {
		return 1
	}
	return 0;
};

sub parseDATA {
	my ($self, $text) = @_;
	return 0;
};

sub parseEmbeddeddocumentation {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '=end', 0, 0, 0, 0, 0, '#pop', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseGeneralComment {
	my ($self, $text) = @_;
	# type => keyword
	if ($self->testKeyword($text, 'attention', 0, 0, undef, 0, '#stay', 'Dec')) {
		return 1
	}
	return 0;
};

sub parseLineContinue {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(while|until)\\b(?!.*\\bdo\\b)', 0, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(if|unless)\\b', 0, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('Normal', $text)) {
		return 1
	}
	return 0;
};

sub parseMemberAccess {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.?[_a-z]\\w*(\\?|\\!)?(?=[^\\w\\d\\.\\:])', 0, 0, 0, undef, 0, '#pop', 'Message')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.?[_a-z]\\w*(\\?|\\!)?', 0, 0, 0, undef, 0, '#stay', 'Message')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[A-Z]+_*(\\d|[a-z])\\w*(?=[^\\w\\d\\.\\:])', 0, 0, 0, undef, 0, '#pop', 'Constant')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[A-Z]+_*([0-9]|[a-z])\\w*', 0, 0, 0, undef, 0, '#stay', 'Constant')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[_A-Z][_A-Z0-9]*(?=[^\\w\\d\\.\\:])', 0, 0, 0, undef, 0, '#pop', 'Constant Value')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[_A-Z][_A-Z0-9]*', 0, 0, 0, undef, 0, '#stay', 'Constant Value')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ':', ':', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '.', 0, 0, 0, undef, 0, '#stay', 'Member')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '=+-*/%|&[]{}~', 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '()\\', 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\W', 0, 0, 0, undef, 0, '#pop', 'Member')) {
		return 1
	}
	return 0;
};

sub parseNormal {
	my ($self, $text) = @_;
	# type => LineContinue
	if ($self->testLineContinue($text, 0, undef, 0, 'Line Continue', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '__END__$', 0, 0, 0, 0, 0, 'DATA', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#!\\/.*', 0, 0, 0, 0, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\=|\\(|\\[|\\{)\\s*(if|unless|while|until)\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(while|until)\\b(?!.*\\bdo\\b)', 0, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\;\\s*(while|until)\\b(?!.*\\bdo\\b)', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(if|unless)\\b', 0, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\;\\s*(if|unless)\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bclass\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bmodule\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bbegin\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfor\\b(?!.*\\bdo\\b)', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bcase\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdo\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdef\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bend\\b', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\b|^\\s*)(else|elsif|rescue|ensure)(\\s+|$)', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '...', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '.', '.', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.[_a-z][_a-zA-Z0-9]*(\\?|\\!|\\b)', 0, 0, 0, undef, 0, '#stay', 'Message')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s\\?(\\\\M\\-)?(\\\\C\\-)?\\\\?\\S', 0, 0, 0, undef, 0, '#stay', 'Dec')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'attribute-definitions', 0, 0, undef, 0, '#stay', 'Attribute Definition')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'access-control', 0, 0, undef, 0, '#stay', 'Access Control')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'definitions', 0, 0, undef, 0, '#stay', 'Definition')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'pseudo-variables', 0, 0, undef, 0, '#stay', 'Pseudo variable')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'default-globals', 0, 0, undef, 0, '#stay', 'Default globals')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'kernel-methods', 0, 0, undef, 0, '#stay', 'Kernel methods')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[a-zA-Z_0-9]+', 0, 0, 0, undef, 0, '#stay', 'Global Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\-[a-zA-z_]\\b', 0, 0, 0, undef, 0, '#stay', 'Global Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[\\d_*`\\!:?\'/\\\\\\-\\&]', 0, 0, 0, undef, 0, '#stay', 'Default globals')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[_A-Z]+[A-Z_0-9]+\\b', 0, 0, 0, undef, 0, '#stay', 'Global Constant')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[A-Z]+_*([0-9]|[a-z])[_a-zA-Z0-9]*\\b', 0, 0, 0, undef, 0, '#stay', 'Constant')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b\\-?0[xX][_0-9a-fA-F]+', 0, 0, 0, undef, 0, '#stay', 'Hex')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b\\-?0[bB][_01]+', 0, 0, 0, undef, 0, '#stay', 'Bin')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b\\-?0[1-7][_0-7]*', 0, 0, 0, undef, 0, '#stay', 'Octal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b\\-?[0-9][0-9_]*\\.[0-9][0-9_]*([eE]\\-?[1-9][0-9]*(\\.[0-9]*)?)?', 0, 0, 0, undef, 0, '#stay', 'Float')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b\\-?[1-9][0-9_]*\\b', 0, 0, 0, undef, 0, '#stay', 'Dec')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, '#stay', 'Dec')) {
		return 1
	}
	# type => HlCChar
	if ($self->testHlCChar($text, 0, undef, 0, '#stay', 'Char')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '=begin', 0, 0, 0, 0, 0, 'Embedded documentation', 'Blockcomment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*<<-(?=\\w+|["\'])', 0, 0, 0, undef, 0, 'find_indented_heredoc', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*<<(?=\\w+|["\'])', 0, 0, 0, undef, 0, 'find_heredoc', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '.', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '&', '&', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '|', '|', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s[\\?\\:\\%/]\\s', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[|&<>\\^\\+*~\\-=]+', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s!', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '/=\\s', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '%=', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ':', ':', 0, 0, 0, undef, 0, 'Member Access', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, ':[a-zA-Z_][a-zA-Z0-9_]*', 0, 0, 0, undef, 0, '#stay', 'Symbol')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'Quoted String', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'Apostrophed String', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, 'Command String', 'Command')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '?#', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*BEGIN.*$', 0, 0, 0, 0, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#\\s*END.*$', 0, 0, 0, 0, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#', 0, 0, 0, undef, 1, 'Comment Line', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s#', 0, 0, 0, undef, 0, 'General Comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\[\\]]+', 0, 0, 0, undef, 0, '#stay', 'Delimiter')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Delimiter')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Delimiter')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '@[a-zA-Z_0-9]+', 0, 0, 0, undef, 0, '#stay', 'Instance Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '@@[a-zA-Z_0-9]+', 0, 0, 0, undef, 0, '#stay', 'Class Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '/', 0, 0, 0, undef, 0, 'RegEx 1', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*[%](?=[Qqxw]?[^\\s])', 0, 0, 0, undef, 0, 'find_gdl_input', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parseQuotedString {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '\\\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\\\"', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parseRDocLabel {
	my ($self, $text) = @_;
	return 0;
};

sub parseRegEx1 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\\\/', 0, 0, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^\\\\]$', 0, 0, 0, undef, 0, '#pop', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '/[uiomxn]*', 0, 0, 0, undef, 0, '#pop', 'Regular Expression')) {
		return 1
	}
	return 0;
};

sub parseShortSubst {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, '#stay', 'Substitution')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\w(?!\\w)', 0, 0, 0, undef, 0, '#pop', 'Substitution')) {
		return 1
	}
	return 0;
};

sub parseSubst {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Substitution')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('Normal', $text)) {
		return 1
	}
	return 0;
};

sub parseapostrophed_indented_heredoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1$', 0, 1, 0, undef, 1, '#pop#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseapostrophed_normal_heredoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1$', 0, 1, 0, 0, 0, '#pop#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseapostrophed_rules {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parsedq_string_rules {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	return 0;
};

sub parsefind_gdl_input {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, 'w\\(', 0, 0, 0, undef, 0, 'gdl_token_array_1', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'w\\{', 0, 0, 0, undef, 0, 'gdl_token_array_2', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'w\\[', 0, 0, 0, undef, 0, 'gdl_token_array_3', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'w<', 0, 0, 0, undef, 0, 'gdl_token_array_4', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'w([^\\s\\w])', 0, 0, 0, undef, 0, 'gdl_token_array_5', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'q\\(', 0, 0, 0, undef, 0, 'gdl_apostrophed_1', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'q\\{', 0, 0, 0, undef, 0, 'gdl_apostrophed_2', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'q\\[', 0, 0, 0, undef, 0, 'gdl_apostrophed_3', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'q<', 0, 0, 0, undef, 0, 'gdl_apostrophed_4', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'q([^\\s\\w])', 0, 0, 0, undef, 0, 'gdl_apostrophed_5', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'x\\(', 0, 0, 0, undef, 0, 'gdl_shell_command_1', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'x\\{', 0, 0, 0, undef, 0, 'gdl_shell_command_2', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'x\\[', 0, 0, 0, undef, 0, 'gdl_shell_command_3', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'x<', 0, 0, 0, undef, 0, 'gdl_shell_command_4', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'x([^\\s\\w])', 0, 0, 0, undef, 0, 'gdl_shell_command_5', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'r\\(', 0, 0, 0, undef, 0, 'gdl_regexpr_1', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'r\\{', 0, 0, 0, undef, 0, 'gdl_regexpr_2', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'r\\[', 0, 0, 0, undef, 0, 'gdl_regexpr_3', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'r<', 0, 0, 0, undef, 0, 'gdl_regexpr_4', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'r([^\\s\\w])', 0, 0, 0, undef, 0, 'gdl_regexpr_5', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'Q?\\(', 0, 0, 0, undef, 0, 'gdl_dq_string_1', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'Q?\\{', 0, 0, 0, undef, 0, 'gdl_dq_string_2', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'Q?\\[', 0, 0, 0, undef, 0, 'gdl_dq_string_3', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'Q?<', 0, 0, 0, undef, 0, 'gdl_dq_string_4', 'GDL input')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, 'Q?([^\\s\\w])', 0, 0, 0, undef, 0, 'gdl_dq_string_5', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsefind_heredoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\'(\\w+)\'', 0, 0, 0, undef, 0, 'apostrophed_normal_heredoc', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '"?(\\w+)"?', 0, 0, 0, undef, 0, 'normal_heredoc', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsefind_indented_heredoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\'(\\w+)\'', 0, 0, 0, undef, 0, 'apostrophed_indented_heredoc', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '"?(\\w+)"?', 0, 0, 0, undef, 0, 'indented_heredoc', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_apostrophed_1_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_1_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_apostrophed_1_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_2 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_apostrophed_2_nested', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_2_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_apostrophed_2_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_3 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_apostrophed_3_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_3_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_apostrophed_3_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_4 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '>', 0, 0, 0, undef, 0, '#stay', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_apostrophed_4_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_4_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_apostrophed_4_nested', 'Raw String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'Raw String')) {
		return 1
	}
	return 0;
};

sub parsegdl_apostrophed_5 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('apostrophed_rules', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'Raw String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%1', 0, 1, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_dq_string_1_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_1_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_dq_string_1_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_2 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_dq_string_2_nested', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_2_nested {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_dq_string_2_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_3 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_dq_string_3_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_3_nested {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_dq_string_3_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_4 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '>', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_dq_string_4_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_4_nested {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_dq_string_4_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	return 0;
};

sub parsegdl_dq_string_5 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('dq_string_rules', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%1', 0, 1, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_regexpr_1_nested', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\)[uiomxn]*', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_1_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_regexpr_1_nested', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Regular Expression')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_2 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\}[uiomxn]*', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_regexpr_2_nested', 'Regular Expression')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_2_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_regexpr_2_nested', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Regular Expression')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_3 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_regexpr_3_nested', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\][uiomxn]*', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_3_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_regexpr_3_nested', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Regular Expression')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_4 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '>', 0, 0, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_regexpr_4_nested', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '>[uiomxn]*', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_4_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_regexpr_4_nested', 'Regular Expression')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'Regular Expression')) {
		return 1
	}
	return 0;
};

sub parsegdl_regexpr_5 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regexpr_rules', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%1[uiomxn]*', 0, 1, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_shell_command_1_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_1_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_shell_command_1_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Command')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_2 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_shell_command_2_nested', 'Command')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_2_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_shell_command_2_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Command')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_3 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_shell_command_3_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_3_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_shell_command_3_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Command')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_4 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '>', 0, 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_shell_command_4_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_4_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_shell_command_4_nested', 'Command')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'Command')) {
		return 1
	}
	return 0;
};

sub parsegdl_shell_command_5 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('shell_command_rules', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%1', 0, 1, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_1 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_token_array_1_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_1_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'gdl_token_array_1_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_2 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_token_array_2_nested', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_2_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'gdl_token_array_2_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_3 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_token_array_3_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_3_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'gdl_token_array_3_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_4 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '>', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_token_array_4_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_4_nested {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'gdl_token_array_4_nested', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parsegdl_token_array_5 {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('token_array_rules', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%1', 0, 1, 0, undef, 0, '#pop#pop', 'GDL input')) {
		return 1
	}
	return 0;
};

sub parseheredoc_rules {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	return 0;
};

sub parseindented_heredoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1$', 0, 1, 0, undef, 1, '#pop#pop', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('heredoc_rules', $text)) {
		return 1
	}
	return 0;
};

sub parsenormal_heredoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1$', 0, 1, 0, 0, 0, '#pop#pop', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('heredoc_rules', $text)) {
		return 1
	}
	return 0;
};

sub parseregexpr_rules {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'Regular Expression')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	return 0;
};

sub parseshell_command_rules {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#@{1,2}', 0, 0, 0, undef, 0, 'Short Subst', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '#', '{', 0, 0, 0, undef, 0, 'Subst', 'Substitution')) {
		return 1
	}
	return 0;
};

sub parsetoken_array_rules {
	my ($self, $text) = @_;
	# type => StringDetect
	if ($self->testStringDetect($text, '\\\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Ruby - a Plugin for Ruby syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Ruby;
 my $sh = new Syntax::Highlight::Engine::Kate::Ruby([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Ruby is a  plugin module that provides syntax highlighting
for Ruby to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

