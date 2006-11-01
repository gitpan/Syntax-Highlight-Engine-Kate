
# Copyright (c) 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Syntax::Highlight::Engine::Kate;

use vars qw($VERSION);
$VERSION = '0.02';
use strict;
use warnings;
use Carp;
use Data::Dumper;
use File::Basename;

use base('Syntax::Highlight::Engine::Kate::Template');

# uselist
# end uselist

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my %args = (@_);
	
	my $add = delete $args{'plugins'};
	unless (defined($add)) { $add = [] };
	my $language = delete $args{'language'};
	unless (defined($language)) { $language = 'Off' };
	
	my $self = $class->SUPER::new(%args);

	$self->{'extensions'} = {
		'*.MAB' => ['MAB-DB'],
		'*.h' => ['ANSI C89', 'C', 'C++', 'Inform', 'LPC'],
		' *.ltx' => ['LaTeX'],
		'*.bib' => ['BibTeX'],
		'*.xslt' => ['xslt'],
		'*.rb' => ['Ruby'],
		'*.vcg' => ['GDL'],
		'*.ex' => ['Euphoria'],
		' *.cls' => ['LaTeX'],
		'*.SRC' => ['PicAsm'],
		'*.F90' => ['Fortran'],
		'*.uc' => ['UnrealScript'],
		'*.cue' => ['CUE Sheet'],
		'*.eclass' => ['Bash'],
		'*.tcl' => ['Tcl/Tk'],
		'*.d' => ['D'],
		'*.vhd' => ['VHDL'],
		'*.f90' => ['Fortran'],
		'*.glsl' => ['GLSL'],
		'*.lhs' => ['Literate Haskell'],
		'*.ch' => ['Clipper', 'xHarbour'],
		'*.pot' => ['GNU Gettext'],
		'*.hsp' => ['Spice'],
		'*.rex' => ['REXX'],
		'*.not' => ['Music Publisher'],
		'*.bash' => ['Bash'],
		' *.sty' => ['LaTeX'],
		'*.VCG' => ['GDL'],
		'*.pb' => ['PureBasic'],
		'*makefile*' => ['Makefile'],
		'*.dox' => ['Doxygen'],
		'*.pov' => ['POV-Ray'],
		'QRPGLESRC.*' => ['ILERPG'],
		'*.cgis' => ['CGiS'],
		'*.pas' => ['Pascal'],
		'*.asm' => ['AVR Assembler', 'Asm6502', 'Intel x86 (NASM)', 'PicAsm'],
		'*.FPP' => ['Fortran'],
		'*.gdl' => ['GDL'],
		'*.sce' => ['scilab'],
		'*.cfml' => ['ColdFusion'],
		'*.reg' => ['WINE Config'],
		'*.bro' => ['Component-Pascal'],
		'*.cl' => ['Common Lisp'],
		'*.basetest' => ['BaseTest'],
		'*.PER' => ['4GL-PER'],
		'*.lsp' => ['Common Lisp'],
		'*.cpp' => ['C++'],
		'*.ldif' => ['LDIF'],
		'*.idl' => ['IDL'],
		'*.v' => ['Verilog'],
		'*.lex' => ['Lex/Flex'],
		'*.fe' => ['ferite'],
		'*.PRG' => ['Clipper', 'xHarbour'],
		'*.guile' => ['Scheme'],
		'*.S' => ['GNU Assembler'],
		'*.shtm' => ['HTML'],
		'*.F' => ['Fortran'],
		'*.4GL' => ['4GL'],
		'*.hxx' => ['C++'],
		'*.per' => ['4GL-PER'],
		'*.hs' => ['Haskell'],
		'*.f' => ['Fortran'],
		'*.vhdl' => ['VHDL'],
		'*.exw' => ['Euphoria'],
		'*.exu' => ['Euphoria'],
		'*.tk' => ['Tcl/Tk'],
		'*.pike' => ['Pike'],
		'*.tex' => ['LaTeX'],
		'*.rdf' => ['XML'],
		'*.spec' => ['RPM Spec'],
		'*.siv' => ['Sieve'],
		'*.cs' => ['C#'],
		'*.inf' => ['Inform'],
		'*.C' => ['ANSI C89', 'C', 'C++'],
		'*.w' => ['progress'],
		'*.phtm' => ['PHP (HTML)'],
		'ChangeLog' => ['ChangeLog'],
		'*.html' => ['HTML', 'Mason'],
		'*.H' => ['C++'],
		'*.PIC' => ['PicAsm'],
		'*.p' => ['Pascal', 'progress'],
		'*.shtml' => ['HTML'],
		'*.kdelnk' => ['.desktop'],
		'*.do' => ['Stata'],
		'*.php' => ['PHP (HTML)'],
		'*.FOR' => ['Fortran'],
		'*.pp' => ['Pascal'],
		'*.ahdl' => ['AHDL'],
		'*.m' => ['Matlab', 'Octave'],
		'*.cg' => ['Cg'], 
		'*.y' => ['Yacc/Bison'],
		'*.py' => ['Python'],
		'*.xml' => ['XML'],
		'*.ps' => ['PostScript'],
		'*.vl' => ['Verilog'],
		'*.ini' => ['INI Files'],
		'*.jsp' => ['JSP'],
		'*.dbm' => ['ColdFusion'],
		'*.sql' => ['SQL', 'SQL (MySQL)', 'SQL (PostgreSQL)'],
		'*.cfg' => ['Quake Script'],
		'*.hcc' => ['C++'],
		'*.F95' => ['Fortran'],
		'*.prolog' => ['Prolog'],
		'*.i' => ['progress'],
		'*.flex' => ['Lex/Flex'],
		'*.sml' => ['SML'],
		'*patch' => ['Diff'],
		'*.Mab' => ['MAB-DB'],
		'*.phtml' => ['PHP (HTML)'],
		'*.mod' => ['Modula-2'],
		'*.tst' => ['BaseTestchild'],
		'*.per.err' => ['4GL-PER'],
		'*.lua' => ['Lua'],
		'*.sp' => ['Spice'],
		'*.D' => ['D'],
		'*.java' => ['Java'],
		'*.kbasic' => ['KBasic'],
		'*.tdf' => ['AHDL'],
		'*.lisp' => ['Common Lisp'],
		'*.rc' => ['XML'],
		'*.docbook' => ['XML'],
		'*.rib' => ['RenderMan RIB'],
		'*.a' => ['Ada'],
		'*.po' => ['GNU Gettext'],
		'*.md' => ['Modula-2'],
		'*.e' => ['E Language', 'Eiffel', 'Euphoria'],
		'*.R' => ['R Script'],
		'*.php3' => ['PHP (HTML)'],
		'*.prg' => ['Clipper', 'xHarbour'],
		'*.htm' => ['HTML'],
		'*.asp' => ['ASP'],
		'*.ada' => ['Ada'],
		'*.fpp' => ['Fortran'],
		'*.asm-avr' => ['AVR Assembler'],
		'*.JSP' => ['JSP'],
		'*.sh' => ['Bash'],
		'*.inc' => ['LPC', 'PHP (HTML)','POV-Ray'],
		'*.pyw' => ['Python'],
		'*.cxx' => ['C++'],
		'*.pm' => ['Perl'],
		'*.wml' => ['PHP (HTML)'],
		'*.mi' => ['Modula-2'],
		'*.err' => ['4GL'],
		'*.ml' => ['SML'],
		'*.pls' => ['INI Files'],
		'*.M' => ['Matlab', 'Octave'],
		'*.hpp' => ['C++'],
		'*.sgml' => ['SGML'],
		'*.s' => ['GNU Assembler', 'MIPS Assembler'],
		'*.SQL' => ['SQL', 'SQL (MySQL)', 'SQL (PostgreSQL)'],
		'*.t2t' => ['txt2tags'],
		'*.css' => ['CSS'],
		'*.for' => ['Fortran'],
		'*.V' => ['Verilog'],
		'*.desktop' => ['.desktop'],
		'*.moc' => ['C++'],
		'*.ebuild' => ['Bash'],
		'*.scheme' => ['Scheme'],
		'*.adb' => ['Ada'],
		'*.eps' => ['PostScript'],
		'*.diff' => ['Diff'],
		'*.octave' => ['Octave'],
		'*.def' => ['Modula-2'],
		'*.ai' => ['PostScript'],
		'*.dtx' => ['LaTeX'],
		'*.pic' => ['PicAsm'],
		'*.pl' => ['Perl'],
		'*.cmake' => ['CMake'],
		'*.ss' => ['Scheme'],
		'CMakeLists.txt' => ['CMake'],
		'*.sa' => ['Sather'],
		'*.mup' => ['Music Publisher'],
		'*.LY' => ['LilyPond'],
		'*.GDL' => ['GDL'],
		'*.cfm' => ['ColdFusion'],
		'*.ly' => ['LilyPond'],
		'*.ASM' => ['AVR Assembler', 'PicAsm'],
		'*.4gl' => ['4GL'],
		'*Makefile*' => ['Makefile'],
		'*.cc' => ['C++'],
		'*.wrl' => ['VRML'],
		'*.ads' => ['Ada'],
		'*.mab' => ['MAB-DB'],
		'*.pro' => ['RSI IDL'],
		'*.src' => ['PicAsm'],
		'*.feh' => ['ferite'],
		'*.doxygen' => ['Doxygen'],
		'*.vm' => ['Velocity'],
		'*.scm' => ['Scheme'],
		'*.xsl' => ['xslt'],
		'*.o' => ['LPC'],
		'*.f95' => ['Fortran'],
		'*.sci' => ['scilab'],
		'*.cfc' => ['ColdFusion'],
		'*.l' => ['Lex/Flex'],
		'*.cp' => ['Component-Pascal'],
		'*.awk' => ['AWK'],
		'*.c' => ['ANSI C89', 'C', 'LPC'],
		'*.ys' => ['yacas'],
		'*.js' => ['JavaScript'],
		'*.ado' => ['Stata'],
		'*.daml' => ['XML'],
		'*.cis' => ['Cisco'],
	};
	$self->{'plugins'} = {};
	$self->{'sections'} = {
		'Database' => [
			'4GL',
			'4GL-PER',
			'LDIF',
			'progress',
			'SQL',
			'SQL (MySQL)',
			'SQL (PostgreSQL)'
		],
		'Configuration' => [
			'Cisco',
			'.desktop',
			'INI Files',
			'WINE Config'
		],
		'Hardware' => [
			'AHDL',
			'Spice',
			'VHDL',
			'Verilog'
		],
		'Scripts' => [
			'AWK',
			'Bash',
			'Common Lisp',
			'Euphoria',
			'ferite',
			'JavaScript',
			'Lua',
			'Mason',
			'PHP (HTML)',
			'Perl',
			'Pike',
			'Python',
			'Quake Script',
			'REXX',
			'R Script',
			'Ruby',
			'Scheme',
			'Sieve',
			'Tcl/Tk',
			'UnrealScript',
			'Velocity'
		],
		'Markup' => [
			'ASP',
			'BibTeX',
			'CSS',
			'ColdFusion',
			'Doxygen',
			'GNU Gettext',
			'HTML',
			'JSP',
			'Javadoc',
			'LaTeX',
			'MAB-DB',
			'PostScript',
			'SGML',
			'txt2tags',
			'VRML',
			'XML',
			'XML (Debug)',
			'xslt'
		],
		'Sources' => [
			'ANSI C89',
			'Ada',
			'C',
			'CGiS',
			'C#',
			'Cg',
			'Clipper',
			'Component-Pascal',
			'C++',
			'D',
			'E Language',
			'Eiffel',
			'Fortran',
			'GLSL',
			'Haskell',
			'IDL',
			'ILERPG',
			'Inform',
			'Java',
			'KBasic',
			'LPC',
			'Lex/Flex',
			'Literate Haskell',
			'Modula-2',
			'Pascal',
			'Prolog',
			'PureBasic',
			'RSI IDL',
			'SML',
			'Sather',
			'Stata',
			'xHarbour',
			'yacas',
			'Yacc/Bison'
		],
		'Scientific' => [
			'GDL',
			'Matlab',
			'Octave',
			'scilab',
			'TI Basic'
		],
		'Other' => [
			'CMake',
			'CUE Sheet',
			'ChangeLog',
			'Debian Changelog',
			'Debian Control',
			'Diff',
			'LilyPond',
			'Makefile',
			'Music Publisher',
			'POV-Ray',
			'RPM Spec',
			'RenderMan RIB'
		],
		'Assembler' => [
			'AVR Assembler',
			'Asm6502',
			'GNU Assembler',
			'Intel x86 (NASM)',
			'MIPS Assembler',
			'PicAsm'
		],
	};
	$self->{'syntaxes'} = {
		'txt2tags' => 'Txt2tags',
		'yacas' => 'Yacas',
		'RenderMan RIB' => 'RenderMan_RIB',
		'Haskell' => 'Haskell',
		'CSS' => 'CSS',
		'Ada' => 'Ada',
		'Doxygen' => 'Doxygen',
		'Matlab' => 'Matlab',
		'4GL-PER' => 'FourGLminusPER',
		'AWK' => 'AWK',
		'UnrealScript' => 'UnrealScript',
		'VRML' => 'VRML',
		'RSI IDL' => 'RSI_IDL',
		'VHDL' => 'VHDL',
		'ColdFusion' => 'ColdFusion',
		'AVR Assembler' => 'AVR_Assembler',
		'Scheme' => 'Scheme',
		'ferite' => 'Ferite',
		'SGML' => 'SGML',
		'AHDL' => 'AHDL',
		'BaseTest' => 'BaseTest',
		'Intel x86 (NASM)' => 'Intel_x86_NASM',
		'BaseTestchild' => 'BaseTestchild',
		'Velocity' => 'Velocity',
		'E Language' => 'E_Language',
		'D' => 'D',
		'RPM Spec' => 'RPM_Spec',
		'4GL' => 'FourGL',
		'Debian Control' => 'Debian_Control',
		'R Script' => 'R_Script',
		'ASP' => 'ASP',
		'TI Basic' => 'TI_Basic',
		'Ruby' => 'Ruby',
		'REXX' => 'REXX',
		'GDL' => 'GDL',
		'POV-Ray' => 'POVminusRay',
		'IDL' => 'IDL',
		'XML' => 'XML',
		'Prolog' => 'Prolog',
		'Literate Haskell' => 'Literate_Haskell',
		'GNU Assembler' => 'GNU_Assembler',
		'Pike' => 'Pike',
		'Cg' => 'Cg',
		'Sieve' => 'Sieve',
		'Alerts' => 'Alerts',
		'C' => 'C',
		'Music Publisher' => 'Music_Publisher',
		'PHP/PHP' => 'PHP_PHP',
		'LPC' => 'LPC',
		'Octave' => 'Octave',
		'Lex/Flex' => 'Lex_Flex',
		'BibTeX' => 'BibTeX',
		'SML' => 'SML',
		'progress' => 'Progress',
		'Sather' => 'Sather',
		'MIPS Assembler' => 'MIPS_Assembler',
		'LaTeX' => 'LaTeX',
		'Yacc/Bison' => 'Yacc_Bison',
		'Mason' => 'Mason',
		'MAB-DB' => 'MABminusDB',
		'Fortran' => 'Fortran',
		'KBasic' => 'KBasic',
		'Javadoc' => 'Javadoc',
		'Component-Pascal' => 'ComponentminusPascal',
		'C++' => 'Cplusplus',
		'JSP' => 'JSP',
		'Debian Changelog' => 'Debian_Changelog',
		'SQL (PostgreSQL)' => 'SQL_PostgreSQL',
		'Modula-2' => 'Modulaminus2',
		'Clipper' => 'Clipper',
		'LilyPond' => 'LilyPond',
		'xHarbour' => 'XHarbour',
		'Eiffel' => 'Eiffel',
		'INI Files' => 'INI_Files',
		'xslt' => 'Xslt',
		'CUE Sheet' => 'CUE_Sheet',
		'scilab' => 'Scilab',
		'Verilog' => 'Verilog',
		'Inform' => 'Inform',
		'Makefile' => 'Makefile',
		'Java' => 'Java',
		'Tcl/Tk' => 'Tcl_Tk',
		'C#' => 'Cdash',
		'GNU Gettext' => 'GNU_Gettext',
		'Pascal' => 'Pascal',
		'ChangeLog' => 'ChangeLog',
		'Asm6502' => 'Asm6502',
		'ILERPG' => 'ILERPG',
		'PureBasic' => 'PureBasic',
		'Perl' => 'Perl',
		'CGiS' => 'CGiS',
		'Quake Script' => 'Quake_Script',
		'Common Lisp' => 'Common_Lisp',
		'PicAsm' => 'PicAsm',
		'Diff' => 'Diff',
		'SQL (MySQL)' => 'SQL_MySQL',
		'GLSL' => 'GLSL',
		'JavaScript' => 'JavaScript',
		'Cisco' => 'Cisco',
		'HTML' => 'HTML',
		'XML (Debug)' => 'XML_Debug',
		'SQL' => 'SQL',
		'PHP (HTML)' => 'PHP_HTML',
		'PostScript' => 'PostScript',
		'CMake' => 'CMake',
		'Euphoria' => 'Euphoria',
		'Lua' => 'Lua',
		'Stata' => 'Stata',
		'LDIF' => 'LDIF',
		'Python' => 'Python',
		'Bash' => 'Bash',
		'ANSI C89' => 'ANSI_C89',
		'Spice' => 'Spice',
		'.desktop' => 'Desktop',
		'WINE Config' => 'WINE_Config'
	};
	$self->{'language '} = '';
	bless ($self, $class);
	if ($language ne '') {
		$self->language($language);
	}
	return $self;
}

sub extensions {
	my $self = shift;
	return $self->{'extensions'};
}

#overriding Template's initialize method. now it should not do anything.
sub initialize {
	my $cw = shift;
}

sub language {
	my $self = shift;
	if (@_) {
		$self->{'language'} = shift;
		$self->reset;
	}
	return $self->{'language'};
}

sub languageAutoSet {
	my ($self, $file) = @_;
	my $lang = $self->languagePropose($file);
	if (defined $lang) {
		$self->language($lang)
	} else {
		$self->language('Off')
	}
}

sub languageList {
	my $self = shift;
	my $l = $self->{'syntaxes'};
	return sort {uc($a) cmp uc($b)} keys %$l;
}

sub languagePropose {
	my ($self, $file) = @_;
	my $hsh = $self->extensions;
	foreach my $key (keys %$hsh) {
		my $reg = $key;
		$reg =~ s/\./\\./g;
		$reg =~ s/\*/.*/g;
		$reg = "$reg\$";
		if ($file =~ /$reg/) {
			return $hsh->{$key}->[0]
		}
	}
	return undef;
}

sub languagePlug {
	my ($self, $req) = @_;
	unless (exists($self->{'syntaxes'}->{$req})) {
		warn "undefined language: $req";
		return undef;
	}
	return $self->{'syntaxes'}->{$req};
}

sub reset {
	my $self = shift;
	my $lang = $self->language;
	if ($lang eq 'Off') {
		$self->stack([]);
	} else {
		my $plug	= $self->pluginGet($lang);
		my $basecontext = $plug->basecontext;
		$self->stack([
			[$plug, $basecontext]
		]);
	}
	$self->out([]);
	$self->snippet('');
}

sub sections {
	my $self = shift;
	return $self->{'sections'};
}

sub syntaxes {
	my $self = shift;
	return $self->{'syntaxes'}
}


1;

__END__

