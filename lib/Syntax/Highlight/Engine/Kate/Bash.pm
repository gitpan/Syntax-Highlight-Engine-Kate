# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/bash.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 2.05
#kate version 2.4
#kate author Wilbert Berendsen (wilbert@kde.nl)
#generated: Sun May 28 21:18:23 2006, localtime

package Syntax::Highlight::Engine::Kate::Bash;

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
		'Backquote' => 'Keyword',
		'Builtin' => 'Reserved',
		'Command' => 'BString',
		'Comment' => 'Comment',
		'Control' => 'Keyword',
		'Escape' => 'DataType',
		'Expression' => 'Others',
		'Function' => 'Char',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Option' => 'Normal',
		'Path' => 'Normal',
		'Redirection' => 'Operator',
		'String DoubleQ' => 'String',
		'String Escape' => 'DataType',
		'String SingleQ' => 'String',
		'String Transl.' => 'String',
		'Variable' => 'Others',
	});
	$self->listAdd('builtins',
		'.',
		':',
		'alias',
		'bg',
		'bind',
		'break',
		'builtin',
		'cd',
		'command',
		'compgen',
		'complete',
		'continue',
		'dirs',
		'disown',
		'echo',
		'enable',
		'eval',
		'exec',
		'exit',
		'fc',
		'fg',
		'getopts',
		'hash',
		'help',
		'history',
		'jobs',
		'kill',
		'let',
		'logout',
		'popd',
		'printf',
		'pushd',
		'pwd',
		'return',
		'set',
		'shift',
		'shopt',
		'source',
		'suspend',
		'test',
		'times',
		'trap',
		'type',
		'ulimit',
		'umask',
		'unalias',
		'wait',
	);
	$self->listAdd('builtins_var',
		'declare',
		'export',
		'local',
		'read',
		'readonly',
		'typeset',
		'unset',
	);
	$self->listAdd('keywords',
		'.',
		'elif',
		'else',
		'for',
		'function',
		'in',
		'select',
		'set',
		'then',
		'until',
		'while',
	);
	$self->listAdd('unixcommands',
		'aclocal',
		'aconnect',
		'aplay',
		'apm',
		'apmsleep',
		'apropos',
		'ar',
		'arch',
		'arecord',
		'as',
		'as86',
		'autoconf',
		'autoheader',
		'automake',
		'awk',
		'awk',
		'basename',
		'bash',
		'bc',
		'bison',
		'bunzip2',
		'bzcat',
		'bzcmp',
		'bzdiff',
		'bzegrep',
		'bzfgrep',
		'bzgrep',
		'bzip2',
		'bzip2recover',
		'bzless',
		'bzmore',
		'c++',
		'cal',
		'cat',
		'cat',
		'cc',
		'cd-read',
		'cdda2wav',
		'cdparanoia',
		'cdrdao',
		'cdrecord',
		'chattr',
		'chfn',
		'chgrp',
		'chgrp',
		'chmod',
		'chmod',
		'chown',
		'chown',
		'chroot',
		'chsh',
		'chvt',
		'clear',
		'cmp',
		'co',
		'col',
		'comm',
		'cp',
		'cp',
		'cpio',
		'cpp',
		'cut',
		'date',
		'dc',
		'dcop',
		'dd',
		'dd',
		'deallocvt',
		'df',
		'df',
		'diff',
		'diff3',
		'dir',
		'dir',
		'dircolors',
		'dircolors',
		'directomatic',
		'dirname',
		'dmesg',
		'dnsdomainname',
		'domainname',
		'du',
		'du',
		'dumpkeys',
		'echo',
		'ed',
		'egrep',
		'env',
		'expr',
		'false',
		'fbset',
		'fgconsole',
		'fgrep',
		'file',
		'find',
		'flex',
		'flex++',
		'fmt',
		'free',
		'ftp',
		'funzip',
		'fuser',
		'fuser',
		'g++',
		'gawk',
		'gawk',
		'gc',
		'gcc',
		'gdb',
		'getent',
		'getkeycodes',
		'getopt',
		'gettext',
		'gettextize',
		'gimp',
		'gimp-remote',
		'gimptool',
		'gmake',
		'gocr',
		'grep',
		'groups',
		'gs',
		'gunzip',
		'gzexe',
		'gzip',
		'head',
		'hexdump',
		'hostname',
		'id',
		'igawk',
		'install',
		'install',
		'join',
		'kbd_mode',
		'kbdrate',
		'kdialog',
		'kfile',
		'kill',
		'killall',
		'killall',
		'last',
		'lastb',
		'ld',
		'ld86',
		'ldd',
		'less',
		'lex',
		'link',
		'ln',
		'ln',
		'loadkeys',
		'loadunimap',
		'locate',
		'lockfile',
		'login',
		'logname',
		'lp',
		'lpr',
		'ls',
		'ls',
		'lsattr',
		'lsmod',
		'lsmod.old',
		'lynx',
		'm4',
		'make',
		'man',
		'mapscrn',
		'mesg',
		'mkdir',
		'mkdir',
		'mkfifo',
		'mknod',
		'mknod',
		'mktemp',
		'more',
		'mount',
		'msgfmt',
		'mv',
		'mv',
		'namei',
		'nano',
		'nasm',
		'nawk',
		'netstat',
		'nice',
		'nisdomainname',
		'nl',
		'nm',
		'nm86',
		'nmap',
		'nohup',
		'nop',
		'od',
		'openvt',
		'passwd',
		'patch',
		'pcregrep',
		'pcretest',
		'perl',
		'perror',
		'pgawk',
		'pidof',
		'pidof',
		'ping',
		'pr',
		'printf',
		'procmail',
		'prune',
		'ps',
		'ps2ascii',
		'ps2epsi',
		'ps2frag',
		'ps2pdf',
		'ps2ps',
		'psbook',
		'psmerge',
		'psnup',
		'psresize',
		'psselect',
		'pstops',
		'pstree',
		'pwd',
		'rbash',
		'rcs',
		'readlink',
		'red',
		'resizecons',
		'rev',
		'rm',
		'rm',
		'rmdir',
		'run-parts',
		'sash',
		'scp',
		'sed',
		'sed',
		'seq',
		'setfont',
		'setkeycodes',
		'setleds',
		'setmetamode',
		'setserial',
		'setterm',
		'sh',
		'showkey',
		'shred',
		'shred',
		'size',
		'size86',
		'skill',
		'sleep',
		'slogin',
		'snice',
		'sort',
		'sox',
		'split',
		'ssed',
		'ssh',
		'ssh-add',
		'ssh-agent',
		'ssh-keygen',
		'ssh-keyscan',
		'stat',
		'stat',
		'strings',
		'strip',
		'stty',
		'su',
		'sudo',
		'suidperl',
		'sum',
		'sync',
		'tac',
		'tail',
		'tar',
		'tee',
		'tempfile',
		'test',
		'touch',
		'tr',
		'true',
		'umount',
		'uname',
		'unicode_start',
		'unicode_stop',
		'uniq',
		'unlink',
		'unlink',
		'unzip',
		'updatedb',
		'updmap',
		'uptime',
		'users',
		'utmpdump',
		'uuidgen',
		'vdir',
		'vmstat',
		'w',
		'wall',
		'wc',
		'wc',
		'wget',
		'whatis',
		'whereis',
		'which',
		'who',
		'whoami',
		'write',
		'xargs',
		'xhost',
		'xmodmap',
		'xset',
		'yacc',
		'yes',
		'ypdomainname',
		'zcat',
		'zcmp',
		'zdiff',
		'zegrep',
		'zfgrep',
		'zforce',
		'zgrep',
		'zip',
		'zless',
		'zmore',
		'znew',
		'zsh',
		'zsoelim',
	);
	$self->contextdata({
		'Assign' => {
			callback => \&parseAssign,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'AssignArray' => {
			callback => \&parseAssignArray,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'AssignSubscr' => {
			callback => \&parseAssignSubscr,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'Case' => {
			callback => \&parseCase,
			attribute => 'Normal Text',
		},
		'CaseExpr' => {
			callback => \&parseCaseExpr,
			attribute => 'Normal Text',
		},
		'CaseIn' => {
			callback => \&parseCaseIn,
			attribute => 'Normal Text',
		},
		'Comment' => {
			callback => \&parseComment,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'CommentBackq' => {
			callback => \&parseCommentBackq,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'CommentParen' => {
			callback => \&parseCommentParen,
			attribute => 'Comment',
			lineending => '#pop',
		},
		'ExprBracket' => {
			callback => \&parseExprBracket,
			attribute => 'Normal Text',
		},
		'ExprDblBracket' => {
			callback => \&parseExprDblBracket,
			attribute => 'Normal Text',
		},
		'ExprDblParen' => {
			callback => \&parseExprDblParen,
			attribute => 'Normal Text',
		},
		'ExprDblParenSubst' => {
			callback => \&parseExprDblParenSubst,
			attribute => 'Normal Text',
		},
		'ExprSubParen' => {
			callback => \&parseExprSubParen,
			attribute => 'Normal Text',
		},
		'FindAll' => {
			callback => \&parseFindAll,
			attribute => 'Normal Text',
		},
		'FindCommands' => {
			callback => \&parseFindCommands,
			attribute => 'Normal Text',
		},
		'FindComments' => {
			callback => \&parseFindComments,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'FindCommentsBackq' => {
			callback => \&parseFindCommentsBackq,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'FindCommentsParen' => {
			callback => \&parseFindCommentsParen,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'FindMost' => {
			callback => \&parseFindMost,
			attribute => 'Normal Text',
		},
		'FindOthers' => {
			callback => \&parseFindOthers,
			attribute => 'Normal Text',
		},
		'FindStrings' => {
			callback => \&parseFindStrings,
			attribute => 'Normal Text',
		},
		'FindSubstitutions' => {
			callback => \&parseFindSubstitutions,
			attribute => 'Normal Text',
		},
		'FunctionDef' => {
			callback => \&parseFunctionDef,
			attribute => 'Function',
			lineending => '#pop',
			fallthrough => '#pop',
		},
		'Group' => {
			callback => \&parseGroup,
			attribute => 'Normal Text',
		},
		'HereDoc' => {
			callback => \&parseHereDoc,
			attribute => 'Normal Text',
		},
		'HereDocINQ' => {
			callback => \&parseHereDocINQ,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'HereDocIQ' => {
			callback => \&parseHereDocIQ,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'HereDocNQ' => {
			callback => \&parseHereDocNQ,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'HereDocQ' => {
			callback => \&parseHereDocQ,
			attribute => 'Normal Text',
			dynamic => 1,
		},
		'HereDocRemainder' => {
			callback => \&parseHereDocRemainder,
			attribute => 'Normal Text',
			lineending => '#pop',
		},
		'ProcessSubst' => {
			callback => \&parseProcessSubst,
			attribute => 'Normal Text',
		},
		'Start' => {
			callback => \&parseStart,
			attribute => 'Normal Text',
		},
		'StringDQ' => {
			callback => \&parseStringDQ,
			attribute => 'String DoubleQ',
		},
		'StringEsc' => {
			callback => \&parseStringEsc,
			attribute => 'String SingleQ',
		},
		'StringSQ' => {
			callback => \&parseStringSQ,
			attribute => 'String SingleQ',
		},
		'SubShell' => {
			callback => \&parseSubShell,
			attribute => 'Normal Text',
		},
		'Subscript' => {
			callback => \&parseSubscript,
			attribute => 'Variable',
		},
		'SubstBackq' => {
			callback => \&parseSubstBackq,
			attribute => 'Normal Text',
		},
		'SubstCommand' => {
			callback => \&parseSubstCommand,
			attribute => 'Normal Text',
		},
		'SubstFile' => {
			callback => \&parseSubstFile,
			attribute => 'Normal Text',
		},
		'VarBrace' => {
			callback => \&parseVarBrace,
			attribute => 'Variable',
		},
		'VarName' => {
			callback => \&parseVarName,
			attribute => 'Normal Text',
			lineending => '#pop',
			fallthrough => '#pop',
		},
	});
	$self->deliminators('\\s||\\(|\\)|\\!|\\+|,|<|=|>|\\&|\\*|\\/|;|\\?|\\||\\~|\\\\|`');
	$self->basecontext('Start');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Bash';
}

sub parseAssign {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'AssignArray', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\w:,+_./-]+', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseAssignArray {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'Subscript', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '=', 0, 0, 0, undef, 0, 'Assign', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseAssignSubscr {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'Subscript', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '=', 0, 0, 0, undef, 0, 'Assign', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseCase {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\sin\\b', 0, 0, 0, undef, 0, 'CaseIn', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseCaseExpr {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ';', ';', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindAll', $text)) {
		return 1
	}
	return 0;
};

sub parseCaseIn {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\besac(?=$|[\\s;)])', 0, 0, 0, undef, 0, '#pop#pop', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, 'CaseExpr', 'Keyword')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '(|', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseComment {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	return 0;
};

sub parseCommentBackq {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[^`](?=`)', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	return 0;
};

sub parseCommentParen {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '[^)](?=\\))', 0, 0, 0, undef, 0, '#pop', 'Comment')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includePlugin('Alerts', $text)) {
		return 1
	}
	return 0;
};

sub parseExprBracket {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s\\](?=($|[\\s;|&]))', 0, 0, 0, undef, 0, '#pop', 'Builtin')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\](?=($|[\\s;|&]))', 0, 0, 0, 0, 0, '#pop', 'Builtin')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'ExprSubParen', 'Normal Text')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseExprDblBracket {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s\\]\\](?=($|[\\s;|&]))', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\]\\](?=($|[\\s;|&]))', 0, 0, 0, 0, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'ExprSubParen', 'Normal Text')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseExprDblParen {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ')', ')', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'ExprSubParen', 'Normal Text')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseExprDblParenSubst {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ')', ')', 0, 0, 0, undef, 0, '#pop', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'ExprSubParen', 'Normal Text')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseExprSubParen {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Normal Text')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'ExprSubParen', 'Normal Text')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	return 0;
};

sub parseFindAll {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommands', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseFindCommands {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '(', '(', 0, 0, 0, undef, 0, 'ExprDblParen', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[\\[(?=($|\\s))', 0, 0, 0, 0, 0, 'ExprDblBracket', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s\\[\\[(?=($|\\s))', 0, 0, 0, undef, 0, 'ExprDblBracket', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\[(?=($|\\s))', 0, 0, 0, 0, 0, 'ExprBracket', 'Builtin')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s\\[(?=($|\\s))', 0, 0, 0, undef, 0, 'ExprBracket', 'Builtin')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\{(?=($|\\s))', 0, 0, 0, undef, 0, 'Group', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '(', 0, 0, 0, undef, 0, 'SubShell', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdo(?![\\w$+-])', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdone(?![\\w$+-])', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bif(?![\\w$+-])', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfi(?![\\w$+-])', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bcase(?![\\w$+-])', 0, 0, 0, undef, 0, 'Case', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '-[A-Za-z0-9]+', 0, 0, 0, undef, 0, '#stay', 'Option')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--[a-z][A-Za-z0-9_-]*', 0, 0, 0, undef, 0, '#stay', 'Option')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[A-Za-z_][A-Za-z0-9_]*=', 0, 0, 0, undef, 0, 'Assign', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[A-Za-z_][A-Za-z0-9_]*(?=\\[[^]]+\\]=)', 0, 0, 0, undef, 0, 'AssignSubscr', 'Variable')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, ':()', 0, 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfunction\\b', 0, 0, 0, undef, 0, 'FunctionDef', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'keywords', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'builtins', 0, 0, undef, 0, '#stay', 'Builtin')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'unixcommands', 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'builtins_var', 0, 0, undef, 0, 'VarName', 'Builtin')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<<<', 0, 0, 0, undef, 0, '#stay', 'Redirection')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<<', 0, 0, 1, undef, 0, 'HereDoc', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[<>]\\(', 0, 0, 0, undef, 0, 'ProcessSubst', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([0-9]*(>{1,2}|<)(&[0-9]+-?)?|&>|>&|[0-9]*<>)', 0, 0, 0, undef, 0, '#stay', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '([|&])\\1?', 0, 0, 0, undef, 0, '#stay', 'Control')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[A-Za-z_:][A-Za-z0-9_:#%@-]*\\s*\\(\\)', 0, 0, 0, undef, 0, '#stay', 'Function')) {
		return 1
	}
	return 0;
};

sub parseFindComments {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 1, 'Comment', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\s;](?=#)', 0, 0, 0, undef, 0, 'Comment', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseFindCommentsBackq {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 1, 'CommentBackq', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\s;](?=#)', 0, 0, 0, undef, 0, 'CommentBackq', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseFindCommentsParen {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '#', 0, 0, 0, undef, 1, 'CommentParen', 'Comment')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[\\s;](?=#)', 0, 0, 0, undef, 0, 'CommentParen', 'Normal Text')) {
		return 1
	}
	return 0;
};

sub parseFindMost {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('FindComments', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseFindOthers {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[][;"\\\\\'$`{}()|&<>* ]', 0, 0, 0, undef, 0, '#stay', 'Escape')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\$', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\{(?!(\\s|$))\\S*\\}', 0, 0, 0, undef, 0, '#stay', 'Escape')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\.?/[\\w_@.+-]+(?=([\\s/):]|$))', 0, 0, 0, undef, 0, '#stay', 'Path')) {
		return 1
	}
	return 0;
};

sub parseFindStrings {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'StringSQ', 'String SingleQ')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, 'StringDQ', 'String DoubleQ')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '$', '\'', 0, 0, 0, undef, 0, 'StringEsc', 'String SingleQ')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '$', '"', 0, 0, 0, undef, 0, 'StringDQ', 'String Transl.')) {
		return 1
	}
	return 0;
};

sub parseFindSubstitutions {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[*@#?$!_0-9-]', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[A-Za-z_][A-Za-z0-9_]*\\[', 0, 0, 0, undef, 0, 'Subscript', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[A-Za-z_][A-Za-z0-9_]*', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\{[*@#?$!_0-9-]\\}', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\{#[A-Za-z_][A-Za-z0-9_]*\\}', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\{![A-Za-z_][A-Za-z0-9_]*\\*?\\}', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\{[A-Za-z_][A-Za-z0-9_]*', 0, 0, 0, undef, 0, 'VarBrace', 'Variable')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$\\{[*@#?$!_0-9-](?=[:#%/])', 0, 0, 0, undef, 0, 'VarBrace', 'Variable')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '$((', 0, 0, 0, undef, 0, 'ExprDblParenSubst', 'Variable')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '$(<', 0, 0, 0, undef, 0, 'SubstFile', 'Redirection')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '$(', 0, 0, 0, undef, 0, 'SubstCommand', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, 'SubstBackq', 'Backquote')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[`$\\\\]', 0, 0, 0, undef, 0, '#stay', 'Escape')) {
		return 1
	}
	return 0;
};

sub parseFunctionDef {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s+[A-Za-z_:][A-Za-z0-9_:#%@-]*(\\s*\\(\\))?', 0, 0, 0, undef, 0, '#pop', 'Function')) {
		return 1
	}
	return 0;
};

sub parseGroup {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindAll', $text)) {
		return 1
	}
	return 0;
};

sub parseHereDoc {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<\\s*"([^|&;()<>\\s]+)")', 0, 0, 1, undef, 0, 'HereDocQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<\\s*\'([^|&;()<>\\s]+)\')', 0, 0, 1, undef, 0, 'HereDocQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<\\s*\\\\([^|&;()<>\\s]+))', 0, 0, 1, undef, 0, 'HereDocQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<\\s*([^|&;()<>\\s]+))', 0, 0, 1, undef, 0, 'HereDocNQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<-\\s*"([^|&;()<>\\s]+)")', 0, 0, 1, undef, 0, 'HereDocIQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<-\\s*\'([^|&;()<>\\s]+)\')', 0, 0, 1, undef, 0, 'HereDocIQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<-\\s*\\\\([^|&;()<>\\s]+))', 0, 0, 1, undef, 0, 'HereDocIQ', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '(<<-\\s*([^|&;()<>\\s]+))', 0, 0, 1, undef, 0, 'HereDocINQ', 'Redirection')) {
		return 1
	}
	# type => StringDetect
	if ($self->testStringDetect($text, '<<', 0, 0, 0, undef, 0, '#pop', 'Redirection')) {
		return 1
	}
	return 0;
};

sub parseHereDocINQ {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, undef, 0, 'HereDocRemainder', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%2[\\s;]*$', 0, 1, 0, 0, 0, '#pop#pop', 'Redirection')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	return 0;
};

sub parseHereDocIQ {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, undef, 0, 'HereDocRemainder', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\s*%2[\\s;]*$', 0, 1, 0, 0, 0, '#pop#pop', 'Redirection')) {
		return 1
	}
	return 0;
};

sub parseHereDocNQ {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, undef, 0, 'HereDocRemainder', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%2[\\s;]*$', 0, 1, 0, 0, 0, '#pop#pop', 'Redirection')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	return 0;
};

sub parseHereDocQ {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '%1', 0, 1, 0, undef, 0, 'HereDocRemainder', 'Redirection')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '%2[\\s;]*$', 0, 1, 0, 0, 0, '#pop#pop', 'Redirection')) {
		return 1
	}
	return 0;
};

sub parseHereDocRemainder {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('FindAll', $text)) {
		return 1
	}
	return 0;
};

sub parseProcessSubst {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Redirection')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommentsParen', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommands', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseStart {
	my ($self, $text) = @_;
	# type => IncludeRules
	if ($self->includeRules('FindAll', $text)) {
		return 1
	}
	return 0;
};

sub parseStringDQ {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String DoubleQ')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[`"\\\\$\\n]', 0, 0, 0, undef, 0, '#stay', 'String Escape')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	return 0;
};

sub parseStringEsc {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'String SingleQ')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\[abefnrtv\\\\\']', 0, 0, 0, undef, 0, '#stay', 'String Escape')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\\\([0-7]{1,3}|x[A-Fa-f0-9]{1,2}|c.)', 0, 0, 0, undef, 0, '#stay', 'String Escape')) {
		return 1
	}
	return 0;
};

sub parseStringSQ {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'String SingleQ')) {
		return 1
	}
	return 0;
};

sub parseSubShell {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindAll', $text)) {
		return 1
	}
	return 0;
};

sub parseSubscript {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ']', 0, 0, 0, undef, 0, '#pop', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseSubstBackq {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, '#pop', 'Keyword')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommentsBackq', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommands', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseSubstCommand {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommentsParen', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommands', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseSubstFile {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, ')', 0, 0, 0, undef, 0, '#pop', 'Redirection')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindCommentsParen', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindOthers', $text)) {
		return 1
	}
	return 0;
};

sub parseVarBrace {
	my ($self, $text) = @_;
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#pop', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'Subscript', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindStrings', $text)) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindSubstitutions', $text)) {
		return 1
	}
	return 0;
};

sub parseVarName {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '-[A-Za-z0-9]+', 0, 0, 0, undef, 0, '#stay', 'Option')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '--[a-z][A-Za-z0-9_-]*', 0, 0, 0, undef, 0, '#stay', 'Option')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\b[A-Za-z_][A-Za-z0-9_]*', 0, 0, 0, undef, 0, '#stay', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '[', 0, 0, 0, undef, 0, 'Subscript', 'Variable')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '=', 0, 0, 0, undef, 0, 'Assign', 'Variable')) {
		return 1
	}
	# type => IncludeRules
	if ($self->includeRules('FindMost', $text)) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^]})|;`&><]', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Bash - a Plugin for Bash syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Bash;
 my $sh = new Syntax::Highlight::Engine::Kate::Bash([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Bash is a  plugin module that provides syntax highlighting
for Bash to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

