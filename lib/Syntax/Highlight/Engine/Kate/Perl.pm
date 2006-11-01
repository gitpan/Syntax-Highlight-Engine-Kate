# Copyright (c) 2005 - 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/perl.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.18
#kate version 2.4
#kate author Anders Lund (anders@alweb.dk)
#generated: Wed Nov  1 21:17:51 2006, localtime

package Syntax::Highlight::Engine::Kate::Perl;

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
		'Data' => 'Normal',
		'Data Type' => 'DataType',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Function' => 'Function',
		'Hex' => 'BaseN',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Nothing' => 'Comment',
		'Octal' => 'BaseN',
		'Operator' => 'Operator',
		'Pattern' => 'Others',
		'Pattern Character Class' => 'BaseN',
		'Pattern Internal Operator' => 'Char',
		'Pod' => 'Comment',
		'Pragma' => 'Keyword',
		'Special Variable' => 'Variable',
		'String' => 'String',
		'String (interpolated)' => 'String',
		'String Special Character' => 'Char',
	});
	$self->listAdd('functions',
		'abs',
		'accept',
		'alarm',
		'atan2',
		'bind',
		'binmode',
		'bless',
		'caller',
		'chdir',
		'chmod',
		'chomp',
		'chop',
		'chown',
		'chr',
		'chroot',
		'close',
		'closedir',
		'connect',
		'cos',
		'crypt',
		'dbmclose',
		'dbmopen',
		'defined',
		'delete',
		'die',
		'dump',
		'endgrent',
		'endhostent',
		'endnetent',
		'endprotoent',
		'endpwent',
		'endservent',
		'eof',
		'eval',
		'exec',
		'exists',
		'exit',
		'exp',
		'fcntl',
		'fileno',
		'flock',
		'fork',
		'format',
		'formline',
		'getc',
		'getgrent',
		'getgrgid',
		'getgrnam',
		'gethostbyaddr',
		'gethostbyname',
		'gethostent',
		'getlogin',
		'getnetbyaddr',
		'getnetbyname',
		'getnetent',
		'getpeername',
		'getpgrp',
		'getppid',
		'getpriority',
		'getprotobyname',
		'getprotobynumber',
		'getprotoent',
		'getpwent',
		'getpwnam',
		'getpwuid',
		'getservbyname',
		'getservbyport',
		'getservent',
		'getsockname',
		'getsockopt',
		'glob',
		'gmtime',
		'goto',
		'grep',
		'hex',
		'import',
		'index',
		'int',
		'ioctl',
		'join',
		'keys',
		'kill',
		'last',
		'lc',
		'lcfirst',
		'length',
		'link',
		'listen',
		'localtime',
		'lock',
		'log',
		'lstat',
		'map',
		'mkdir',
		'msgctl',
		'msgget',
		'msgrcv',
		'msgsnd',
		'oct',
		'open',
		'opendir',
		'ord',
		'pack',
		'package',
		'pipe',
		'pop',
		'pos',
		'print',
		'printf',
		'prototype',
		'push',
		'quotemeta',
		'rand',
		'read',
		'readdir',
		'readline',
		'readlink',
		'recv',
		'redo',
		'ref',
		'rename',
		'reset',
		'return',
		'reverse',
		'rewinddir',
		'rindex',
		'rmdir',
		'scalar',
		'seek',
		'seekdir',
		'select',
		'semctl',
		'semget',
		'semop',
		'send',
		'setgrent',
		'sethostent',
		'setnetent',
		'setpgrp',
		'setpriority',
		'setprotoent',
		'setpwent',
		'setservent',
		'setsockopt',
		'shift',
		'shmctl',
		'shmget',
		'shmread',
		'shmwrite',
		'shutdown',
		'sin',
		'sleep',
		'socket',
		'socketpair',
		'sort',
		'splice',
		'split',
		'sprintf',
		'sqrt',
		'srand',
		'stat',
		'study',
		'sub',
		'substr',
		'symlink',
		'syscall',
		'sysread',
		'sysseek',
		'system',
		'syswrite',
		'tell',
		'telldir',
		'tie',
		'time',
		'times',
		'truncate',
		'uc',
		'ucfirst',
		'umask',
		'undef',
		'unlink',
		'unpack',
		'unshift',
		'untie',
		'utime',
		'values',
		'vec',
		'wait',
		'waitpid',
		'wantarray',
		'warn',
		'write',
	);
	$self->listAdd('keywords',
		'BEGIN',
		'END',
		'__DATA__',
		'__END__',
		'__FILE__',
		'__LINE__',
		'__PACKAGE__',
		'break',
		'continue',
		'do',
		'each',
		'else',
		'elsif',
		'for',
		'foreach',
		'if',
		'last',
		'local',
		'my',
		'next',
		'no',
		'our',
		'package',
		'require',
		'require',
		'return',
		'sub',
		'unless',
		'until',
		'use',
		'while',
	);
	$self->listAdd('operators',
		'!=',
		'%',
		'&',
		'&&',
		'&&=',
		'&=',
		'*',
		'**=',
		'*=',
		'+',
		'+=',
		',',
		'-',
		'-=',
		'->',
		'.',
		'/=',
		'::',
		';',
		'<',
		'<<',
		'=',
		'=>',
		'>',
		'>>',
		'?=',
		'\\\\',
		'^',
		'and',
		'eq',
		'ne',
		'not',
		'or',
		'|',
		'|=',
		'||',
		'||=',
		'~=',
	);
	$self->listAdd('pragmas',
		'bytes',
		'constant',
		'diagnostics',
		'english',
		'filetest',
		'integer',
		'less',
		'locale',
		'open',
		'sigtrap',
		'strict',
		'subs',
		'utf8',
		'vars',
		'warnings',
	);
	$self->contextdata({
		'Backticked' => {
			callback => \&parseBackticked,
			attribute => 'String (interpolated)',
		},
		'comment' => {
			callback => \&parsecomment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'data_handle' => {
			callback => \&parsedata_handle,
			attribute => 'Data',
		},
		'end_handle' => {
			callback => \&parseend_handle,
			attribute => 'Nothing',
		},
		'find_here_document' => {
			callback => \&parsefind_here_document,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'find_pattern' => {
			callback => \&parsefind_pattern,
			attribute => 'Pattern',
		},
		'find_qqx' => {
			callback => \&parsefind_qqx,
			attribute => 'Normal Text',
		},
		'find_quoted' => {
			callback => \&parsefind_quoted,
			attribute => 'Normal Text',
		},
		'find_qw' => {
			callback => \&parsefind_qw,
			attribute => 'Normal Text',
		},
		'find_subst' => {
			callback => \&parsefind_subst,
			attribute => 'Normal Text',
		},
		'find_variable' => {
			callback => \&parsefind_variable,
			attribute => 'Data Type',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'find_variable_unsafe' => {
			callback => \&parsefind_variable_unsafe,
			attribute => 'Data Type',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'here_document' => {
			callback => \&parsehere_document,
			attribute => 'String (interpolated)',
			dynamic => 1,
		},
		'here_document_dumb' => {
			callback => \&parsehere_document_dumb,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'ip_string' => {
			callback => \&parseip_string,
			attribute => 'String (interpolated)',
		},
		'ip_string_2' => {
			callback => \&parseip_string_2,
			attribute => 'String (interpolated)',
		},
		'ip_string_3' => {
			callback => \&parseip_string_3,
			attribute => 'String (interpolated)',
		},
		'ip_string_4' => {
			callback => \&parseip_string_4,
			attribute => 'String (interpolated)',
		},
		'ip_string_5' => {
			callback => \&parseip_string_5,
			attribute => 'String (interpolated)',
		},
		'ip_string_6' => {
			callback => \&parseip_string_6,
			attribute => 'String (interpolated)',
			dynamic => 1,
		},
		'ipstring_internal' => {
			callback => \&parseipstring_internal,
			attribute => 'String (interpolated)',
		},
		'normal' => {
			callback => \&parsenormal,
			attribute => 'Normal Text',
		},
		'package_qualified_blank' => {
			callback => \&parsepackage_qualified_blank,
			attribute => 'Normal Text',
		},
		'pat_char_class' => {
			callback => \&parsepat_char_class,
			attribute => 'Pattern Character Class',
		},
		'pat_ext' => {
			callback => \&parsepat_ext,
			attribute => 'Pattern Internal Operator',
		},
		'pattern' => {
			callback => \&parsepattern,
			attribute => 'Pattern',
			dynamic => 1,
		},
		'pattern_brace' => {
			callback => \&parsepattern_brace,
			attribute => 'Pattern',
		},
		'pattern_bracket' => {
			callback => \&parsepattern_bracket,
			attribute => 'Pattern',
		},
		'pattern_paren' => {
			callback => \&parsepattern_paren,
			attribute => 'Pattern',
		},
		'pattern_slash' => {
			callback => \&parsepattern_slash,
			attribute => 'Pattern',
		},
		'pattern_sq' => {
			callback => \&parsepattern_sq,
			attribute => 'Pattern',
		},
		'pod' => {
			callback => \&parsepod,
			attribute => 'Pod',
		},
		'quote_word' => {
			callback => \&parsequote_word,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'quote_word_brace' => {
			callback => \&parsequote_word_brace,
			attribute => 'Normal Text',
		},
		'quote_word_bracket' => {
			callback => \&parsequote_word_bracket,
			attribute => 'Normal Text',
		},
		'quote_word_paren' => {
			callback => \&parsequote_word_paren,
			attribute => 'Normal Text',
		},
		'regex_pattern_internal' => {
			callback => \&parseregex_pattern_internal,
			attribute => 'Pattern',
		},
		'regex_pattern_internal_ip' => {
			callback => \&parseregex_pattern_internal_ip,
			attribute => 'Pattern',
		},
		'regex_pattern_internal_rules_1' => {
			callback => \&parseregex_pattern_internal_rules_1,
		},
		'regex_pattern_internal_rules_2' => {
			callback => \&parseregex_pattern_internal_rules_2,
		},
		'slash_safe_escape' => {
			callback => \&parseslash_safe_escape,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'string' => {
			callback => \&parsestring,
			attribute => 'String',
		},
		'string_2' => {
			callback => \&parsestring_2,
			attribute => 'String',
		},
		'string_3' => {
			callback => \&parsestring_3,
			attribute => 'String',
		},
		'string_4' => {
			callback => \&parsestring_4,
			attribute => 'String',
		},
		'string_5' => {
			callback => \&parsestring_5,
			attribute => 'String',
		},
		'string_6' => {
			callback => \&parsestring_6,
			attribute => 'String',
			dynamic => 1,
		},
		'sub_arg_definition' => {
			callback => \&parsesub_arg_definition,
			attribute => 'Normal Text',
			fallthrough => '#pop#pop',
		},
		'sub_name_def' => {
			callback => \&parsesub_name_def,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'subst_bracket_pattern' => {
			callback => \&parsesubst_bracket_pattern,
			attribute => 'Pattern',
		},
		'subst_bracket_replace' => {
			callback => \&parsesubst_bracket_replace,
			attribute => 'String (interpolated)',
		},
		'subst_curlybrace_middle' => {
			callback => \&parsesubst_curlybrace_middle,
			attribute => 'Normal Text',
		},
		'subst_curlybrace_pattern' => {
			callback => \&parsesubst_curlybrace_pattern,
			attribute => 'Pattern',
		},
		'subst_curlybrace_replace' => {
			callback => \&parsesubst_curlybrace_replace,
			attribute => 'String (interpolated)',
		},
		'subst_curlybrace_replace_recursive' => {
			callback => \&parsesubst_curlybrace_replace_recursive,
			attribute => 'String (interpolated)',
		},
		'subst_paren_pattern' => {
			callback => \&parsesubst_paren_pattern,
			attribute => 'Pattern',
		},
		'subst_paren_replace' => {
			callback => \&parsesubst_paren_replace,
			attribute => 'String (interpolated)',
		},
		'subst_slash_pattern' => {
			callback => \&parsesubst_slash_pattern,
			attribute => 'Pattern',
			dynamic => 1,
		},
		'subst_slash_replace' => {
			callback => \&parsesubst_slash_replace,
			attribute => 'String (interpolated)',
			dynamic => 1,
		},
		'subst_sq_pattern' => {
			callback => \&parsesubst_sq_pattern,
			attribute => 'Pattern',
		},
		'subst_sq_replace' => {
			callback => \&parsesubst_sq_replace,
			attribute => 'String',
		},
		'tr' => {
			callback => \&parsetr,
			attribute => 'Pattern',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'var_detect' => {
			callback => \&parsevar_detect,
			attribute => 'Data Type',
			lineending => '#pop#pop',
			fallthrough => '#pop#pop',
		},
		'var_detect_rules' => {
			callback => \&parsevar_detect_rules,
			attribute => 'Data Type',
			lineending => '#pop#pop',
		},
		'var_detect_unsafe' => {
			callback => \&parsevar_detect_unsafe,
			attribute => 'Data Type',
			lineending => '#pop#pop',
			fallthrough => '#pop#pop',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('normal');
	$self->keywordscase(1);
	$self->initialize;
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Perl';
}

sub parseBackticked {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsecomment {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
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

sub parsedata_handle {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\=(?:head[1-6]|over|back|item|for|begin|end|pod)\\s+.*', 0, 0, 0, 0, 0, 'pod', 'Pod')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '__END__', 0, 0, 0, undef, 1, 'normal', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parseend_handle {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '^\\=(?:head[1-6]|over|back|item|for|begin|end|pod)\\s*.*', 0, 0, 0, undef, 0, 'pod', 'Pod')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '__DATA__', 0, 0, 0, undef, 1, 'data_handle', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsefind_here_document {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(\\w+)\\s*;?', 0, 0, 0, undef, 0, 'here_document', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*"([^"]+)"\\s*;?', 0, 0, 0, undef, 0, 'here_document', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*`([^`]+)`\\s*;?', 0, 0, 0, undef, 0, 'here_document', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\'([^\']+)\'\\s*;?', 0, 0, 0, undef, 0, 'here_document_dumb', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsefind_pattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'pattern_brace', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'pattern_paren', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'pattern_bracket', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'pattern_sq', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([^\\w\\s])', 0, 0, 0, undef, 0, 'pattern', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsefind_qqx {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'ip_string_2', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'ip_string_3', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'ip_string_4', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'ip_string_5', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([^a-zA-Z0-9_\\s[\\]{}()])', 0, 0, 0, undef, 0, 'ip_string_6', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsefind_quoted {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, 'x\\s*(\')', 0, 0, 0, undef, 0, 'string_6', 'Operator')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, 'qx', 0, 0, undef, 0, 'find_qqx', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, 'w', 0, 0, 0, undef, 0, 'find_qw', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'string_2', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'string_3', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'string_4', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '<', 0, 0, 0, undef, 0, 'string_5', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([^a-zA-Z0-9_\\s[\\]{}()])', 0, 0, 0, undef, 0, 'string_6', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsefind_qw {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'quote_word_paren', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'quote_word_brace', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'quote_word_bracket', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([^a-zA-Z0-9_\\s[\\]{}()])', 0, 0, 0, undef, 0, 'quote_word', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	return 0;
};

sub parsefind_subst {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'subst_curlybrace_pattern', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'subst_paren_pattern', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'subst_bracket_pattern', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'subst_sq_pattern', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([^\\w\\s[\\]{}()])', 0, 0, 0, undef, 0, 'subst_slash_pattern', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsefind_variable {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[0-9]+', 0, 0, 0, undef, 0, 'var_detect', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[@\\$](?:[\\+\\-_]\\B|ARGV\\b|INC\\b)', 0, 0, 0, undef, 0, 'var_detect', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[%\\$](?:INC\\b|ENV\\b|SIG\\b)', 0, 0, 0, undef, 0, 'var_detect', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\$[\\$\\w_]', 0, 0, 0, undef, 0, 'var_detect', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[#_][\\w_]', 0, 0, 0, undef, 0, 'var_detect', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$+::', 0, 0, 0, undef, 0, 'var_detect', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[^a-zA-Z0-9\\s{][A-Z]?', 0, 0, 0, undef, 0, '#stay', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\$@%]\\{[\\w_]+\\}', 0, 0, 0, undef, 0, 'var_detect', 'Data Type')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '$@%', 0, 0, undef, 0, 'var_detect', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\*[a-zA-Z_]+', 0, 0, 0, undef, 0, 'var_detect', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\*[^a-zA-Z0-9\\s{][A-Z]?', 0, 0, 0, undef, 0, '#stay', 'Special Variable')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '$@%*', 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsefind_variable_unsafe {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[0-9]+', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[@\\$](?:[\\+\\-_]\\B|ARGV\\b|INC\\b)', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[%\\$](?:INC\\b|ENV\\b|SIG\\b)', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\$[\\$\\w_]', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[#_][\\w_]', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$+::', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[^a-zA-Z0-9\\s{][A-Z]?', 0, 0, 0, undef, 0, '#stay', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\$@%]\\{[\\w_]+\\}', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\$@%]', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Data Type')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\*\\w+', 0, 0, 0, undef, 0, 'var_detect_unsafe', 'Data Type')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '$@%*', 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsehere_document {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, 0, 0, '#pop#pop', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\=\\s*<<\\s*["\']?([A-Z0-9_\\-]+)["\']?', 0, 0, 0, undef, 0, 'here_document', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parsehere_document_dumb {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, 0, 0, '#pop#pop', 'Keyword')) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	return 0;
};

sub parseip_string {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parseip_string_2 {
	my ($self, $text) = @_;
	# type => RangeDetect
	if ($self->testRangeDetect($text, '(', ')', 0, 0, undef, 0, '#stay', 'String (interpolated)')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parseip_string_3 {
	my ($self, $text) = @_;
	# type => RangeDetect
	if ($self->testRangeDetect($text, '{', '}', 0, 0, undef, 0, '#stay', 'String (interpolated)')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parseip_string_4 {
	my ($self, $text) = @_;
	# type => RangeDetect
	if ($self->testRangeDetect($text, '[', ']', 0, 0, undef, 0, '#stay', 'String (interpolated)')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parseip_string_5 {
	my ($self, $text) = @_;
	# type => RangeDetect
	if ($self->testRangeDetect($text, '<', '>', 0, 0, undef, 0, '#stay', 'String (interpolated)')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parseip_string_6 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'String (interpolated)')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '1', 0, 1, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parseipstring_internal {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[UuLlEtnaefr]', 0, 0, 0, undef, 0, '#stay', 'String Special Character')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\.', 0, 0, 0, undef, 0, '#stay', 'String (interpolated)')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(?:[\\$@]\\S|%[\\w{])', 0, 0, 1, undef, 0, 'find_variable_unsafe', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsenormal {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '^#!\\/.*', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '__DATA__', 0, 0, 0, undef, 1, 'data_handle', 'Keyword')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '__END__', 0, 0, 0, undef, 1, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bsub\\s+', 0, 0, 0, undef, 0, 'sub_name_def', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'operators', 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'functions', 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'pragmas', 0, 0, undef, 0, '#stay', 'Pragma')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\=(?:head[1-6]|over|back|item|for|begin|end|pod)(\\s|$)', 0, 0, 0, 0, 0, 'pod', 'Pod')) {
		return 1
	}
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 0, 'comment', 'Comment')) {
		return 1
	}
	# type => HlCOct
	if ($self->testHlCOct($text, 0, undef, 0, 'slash_safe_escape', 'Octal')) {
		return 1
	}
	# type => HlCHex
	if ($self->testHlCHex($text, 0, undef, 0, 'slash_safe_escape', 'Hex')) {
		return 1
	}
	# type => Float
	if ($self->testFloat($text, 0, undef, 0, 'slash_safe_escape', 'Float')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, undef, 0, 'slash_safe_escape', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\(["\'])[^\\1]', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '&', '\'', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'ip_string', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'string', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, 'Backticked', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(?:[$@]\\S|%[\\w{]|\\*[^\\d\\*{\\$@%=(])', 0, 0, 1, undef, 0, 'find_variable', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '<[A-Z0-9_]+>', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*<<(?=\\w+|\\s*["\'])', 0, 0, 0, undef, 0, 'find_here_document', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\}\\s*/', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*[)]\\s*/', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\w+::', 0, 0, 0, undef, 0, 'sub_name_def', 'Function')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\w+[=]', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bq(?=[qwx]?\\s*[^\\w\\s])', 0, 0, 0, undef, 0, 'find_quoted', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bs(?=\\s*[^\\w\\s])', 0, 0, 0, undef, 0, 'find_subst', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b(?:tr|y)\\s*(?=[^\\w\\s])', 0, 0, 0, undef, 0, 'tr', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b(?:m|qr)(?=\\s*[^\\w\\s\\]})])', 0, 0, 0, undef, 0, 'find_pattern', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\w_]+\\s*/', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[<>"\':]/', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '/', 0, 0, 0, undef, 0, 'pattern_slash', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '-[rwxoRWXOeszfdlpSbctugkTBMAC]', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsepackage_qualified_blank {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\w_]+', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsepat_char_class {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '^', 0, 0, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'Pattern Character Class')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'Pattern Character Class')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[:^?[a-z]+:\\]', 0, 0, 0, undef, 0, '#stay', 'Pattern Character Class')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Pattern Internal Operator')) {
		return 1
	}
	return 0;
};

sub parsepat_ext {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\#[^)]*', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[:=!><]+', 0, 0, 0, undef, 0, '#pop', 'Pattern Internal Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Pattern Internal Operator')) {
		return 1
	}
	return 0;
};

sub parsepattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$(?=%1)', 0, 1, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%1[cgimosx]*', 0, 1, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$(?=\\%1)', 0, 1, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	return 0;
};

sub parsepattern_brace {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\}[cgimosx]*', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	return 0;
};

sub parsepattern_bracket {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\][cgimosx]*', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	return 0;
};

sub parsepattern_paren {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\)[cgimosx]*', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	return 0;
};

sub parsepattern_slash {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$(?=/)', 0, 0, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '/[cgimosx]*', 0, 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsepattern_sq {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\'[cgimosx]*', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal', $text)) {
		return 1
	}
	return 0;
};

sub parsepod {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\=(?:head[1-6]|over|back|item|for|begin|end|pod)\\s*.*', 0, 0, 0, 0, 0, '#stay', 'Pod')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\=cut.*$', 0, 0, 0, 0, 0, '#pop', 'Pod')) {
		return 1
	}
	return 0;
};

sub parsequote_word {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '1', 0, 1, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsequote_word_brace {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsequote_word_bracket {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsequote_word_paren {
	my ($self, $text) = @_;
	# type => DetectSpaces
	if ($self->testDetectSpaces($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parseregex_pattern_internal {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_rules_1', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_rules_2', $text)) {
		return 1
	}
	return 0;
};

sub parseregex_pattern_internal_ip {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_rules_1', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[$@][^]\\s{}()|>\']', 0, 0, 1, undef, 0, 'find_variable_unsafe', 'Data Type')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_rules_2', $text)) {
		return 1
	}
	return 0;
};

sub parseregex_pattern_internal_rules_1 {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '#.*$', 0, 0, 0, undef, 1, '#stay', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[anDdSsWw]', 0, 0, 0, undef, 0, '#stay', 'Pattern Character Class')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[ABbEGLlNUuQdQZz]', 0, 0, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[\\d]+', 0, 0, 0, undef, 0, '#stay', 'Special Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\.', 0, 0, 0, undef, 0, '#stay', 'Pattern')) {
		return 1
	}
	return 0;
};

sub parseregex_pattern_internal_rules_2 {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '(', '?', 0, 0, 0, undef, 0, 'pat_ext', 'Pattern Internal Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'pat_char_class', 'Pattern Internal Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[()?^*+|]', 0, 0, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\{[\\d, ]+\\}', 0, 0, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '$', 0, 0, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s{3,}#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseslash_safe_escape {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\]?\\s*/', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\}?\\s*/', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\)?\\s*/', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	return 0;
};

sub parsestring {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\'', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsestring_2 {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ')', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '(', ')', 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsestring_3 {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '}', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '{', '}', 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsestring_4 {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', ']', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '[', ']', 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsestring_5 {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '<', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '>', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '<', '>', 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '>', 0, 0, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsestring_6 {
	my ($self, $text) = @_;
	# type => DetectIdentifier
	if ($self->testDetectIdentifier($text, 0, undef, 0, '#stay', undef)) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\%1', 0, 1, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '1', 0, 1, 0, undef, 0, '#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesub_arg_definition {
	my ($self, $text) = @_;
	# type => AnyChar
	if ($self->testAnyChar($text, '*$@%', 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '&\\[];', 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, 'slash_safe_escape', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsesub_name_def {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\w+', 0, 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\S', 0, 0, 1, undef, 0, 'find_variable', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*\\(', 0, 0, 0, undef, 0, 'sub_arg_definition', 'Normal Text')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ':', ':', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsesubst_bracket_pattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, 'subst_bracket_replace', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_bracket_replace {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\][cegimosx]*', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_curlybrace_middle {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'subst_curlybrace_replace', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_curlybrace_pattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, 'subst_curlybrace_middle', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_curlybrace_replace {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'subst_curlybrace_replace_recursive', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\}[cegimosx]*', 0, 0, 0, undef, 0, '#pop#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_curlybrace_replace_recursive {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, 'subst_curlybrace_replace_recursive', 'String (interpolated)')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	return 0;
};

sub parsesubst_paren_pattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, 'subst_paren_replace', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_paren_replace {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\)[cegimosx]*', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_slash_pattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$(?=%1)', 0, 1, 0, undef, 0, '#stay', 'Pattern Internal Operator')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(%1)', 0, 1, 0, undef, 0, 'subst_slash_replace', 'Operator')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal_ip', $text)) {
		return 1
	}
	return 0;
};

sub parsesubst_slash_replace {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('ipstring_internal', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%1[cegimosx]*', 0, 1, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_sq_pattern {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('regex_pattern_internal', $text)) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'subst_sq_replace', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsesubst_sq_replace {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\'[cegimosx]*', 0, 0, 0, undef, 0, '#pop#pop#pop', 'Operator')) {
		return 1
	}
	return 0;
};

sub parsetr {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\([^)]*\\)\\s*\\(?:[^)]*\\)', 0, 0, 0, undef, 0, '#pop', 'Pattern')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\{[^}]*\\}\\s*\\{[^}]*\\}', 0, 0, 0, undef, 0, '#pop', 'Pattern')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[[^}]*\\]\\s*\\[[^\\]]*\\]', 0, 0, 0, undef, 0, '#pop', 'Pattern')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([^a-zA-Z0-9_\\s[\\]{}()]).*?\\1.*?\\1', 0, 0, 0, undef, 0, '#pop', 'Pattern')) {
		return 1
	}
	return 0;
};

sub parsevar_detect {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('var_detect_rules', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('slash_safe_escape', $text)) {
		return 1
	}
	return 0;
};

sub parsevar_detect_rules {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\w_]+', 0, 0, 0, undef, 0, '#stay', 'Data Type')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ':', ':', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '-', '>', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '+', '+', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '-', '-', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parsevar_detect_unsafe {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('var_detect_rules', $text)) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Perl - a Plugin for Perl syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Perl;
 my $sh = new Syntax::Highlight::Engine::Kate::Perl([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Perl is a  plugin module that provides syntax highlighting
for Perl to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

