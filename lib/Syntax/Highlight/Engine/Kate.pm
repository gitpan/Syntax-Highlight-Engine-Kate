
# Copyright (c) 2006 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Syntax::Highlight::Engine::Kate;

use vars qw($VERSION);
$VERSION = '0.01';
use strict;
use warnings;

use Carp;
use Data::Dumper;

# uselist
use Syntax::Highlight::Engine::Kate::AHDL;
use Syntax::Highlight::Engine::Kate::ANSI_C89;
use Syntax::Highlight::Engine::Kate::ASP;
use Syntax::Highlight::Engine::Kate::AVR_Assembler;
use Syntax::Highlight::Engine::Kate::AWK;
use Syntax::Highlight::Engine::Kate::Ada;
use Syntax::Highlight::Engine::Kate::Alerts;
use Syntax::Highlight::Engine::Kate::Asm6502;
use Syntax::Highlight::Engine::Kate::BaseTest;
use Syntax::Highlight::Engine::Kate::BaseTestchild;
use Syntax::Highlight::Engine::Kate::Bash;
use Syntax::Highlight::Engine::Kate::BibTeX;
use Syntax::Highlight::Engine::Kate::C;
use Syntax::Highlight::Engine::Kate::CGiS;
use Syntax::Highlight::Engine::Kate::CMake;
use Syntax::Highlight::Engine::Kate::CSS;
use Syntax::Highlight::Engine::Kate::CUE_Sheet;
use Syntax::Highlight::Engine::Kate::Cdash;
use Syntax::Highlight::Engine::Kate::Cg;
use Syntax::Highlight::Engine::Kate::ChangeLog;
use Syntax::Highlight::Engine::Kate::Cisco;
use Syntax::Highlight::Engine::Kate::Clipper;
use Syntax::Highlight::Engine::Kate::ColdFusion;
use Syntax::Highlight::Engine::Kate::Common_Lisp;
use Syntax::Highlight::Engine::Kate::ComponentminusPascal;
use Syntax::Highlight::Engine::Kate::Cplusplus;
use Syntax::Highlight::Engine::Kate::D;
use Syntax::Highlight::Engine::Kate::Debian_Changelog;
use Syntax::Highlight::Engine::Kate::Debian_Control;
use Syntax::Highlight::Engine::Kate::Desktop;
use Syntax::Highlight::Engine::Kate::Diff;
use Syntax::Highlight::Engine::Kate::Doxygen;
use Syntax::Highlight::Engine::Kate::E_Language;
use Syntax::Highlight::Engine::Kate::Eiffel;
use Syntax::Highlight::Engine::Kate::Euphoria;
use Syntax::Highlight::Engine::Kate::Ferite;
use Syntax::Highlight::Engine::Kate::Fortran;
use Syntax::Highlight::Engine::Kate::FourGL;
use Syntax::Highlight::Engine::Kate::FourGLminusPER;
use Syntax::Highlight::Engine::Kate::GDL;
use Syntax::Highlight::Engine::Kate::GLSL;
use Syntax::Highlight::Engine::Kate::GNU_Assembler;
use Syntax::Highlight::Engine::Kate::GNU_Gettext;
use Syntax::Highlight::Engine::Kate::HTML;
use Syntax::Highlight::Engine::Kate::Haskell;
use Syntax::Highlight::Engine::Kate::IDL;
use Syntax::Highlight::Engine::Kate::ILERPG;
use Syntax::Highlight::Engine::Kate::INI_Files;
use Syntax::Highlight::Engine::Kate::Inform;
use Syntax::Highlight::Engine::Kate::Intel_x86_NASM;
use Syntax::Highlight::Engine::Kate::JSP;
use Syntax::Highlight::Engine::Kate::Java;
use Syntax::Highlight::Engine::Kate::JavaScript;
use Syntax::Highlight::Engine::Kate::Javadoc;
use Syntax::Highlight::Engine::Kate::KBasic;
use Syntax::Highlight::Engine::Kate::LDIF;
use Syntax::Highlight::Engine::Kate::LPC;
use Syntax::Highlight::Engine::Kate::LaTeX;
use Syntax::Highlight::Engine::Kate::Lex_Flex;
use Syntax::Highlight::Engine::Kate::LilyPond;
use Syntax::Highlight::Engine::Kate::Literate_Haskell;
use Syntax::Highlight::Engine::Kate::Lua;
use Syntax::Highlight::Engine::Kate::MABminusDB;
use Syntax::Highlight::Engine::Kate::MIPS_Assembler;
use Syntax::Highlight::Engine::Kate::Makefile;
use Syntax::Highlight::Engine::Kate::Mason;
use Syntax::Highlight::Engine::Kate::Matlab;
use Syntax::Highlight::Engine::Kate::Modulaminus2;
use Syntax::Highlight::Engine::Kate::Music_Publisher;
use Syntax::Highlight::Engine::Kate::Octave;
use Syntax::Highlight::Engine::Kate::PHP_HTML;
use Syntax::Highlight::Engine::Kate::PHP_PHP;
use Syntax::Highlight::Engine::Kate::POVminusRay;
use Syntax::Highlight::Engine::Kate::Pascal;
use Syntax::Highlight::Engine::Kate::Perl;
use Syntax::Highlight::Engine::Kate::PicAsm;
use Syntax::Highlight::Engine::Kate::Pike;
use Syntax::Highlight::Engine::Kate::PostScript;
use Syntax::Highlight::Engine::Kate::Progress;
use Syntax::Highlight::Engine::Kate::Prolog;
use Syntax::Highlight::Engine::Kate::PureBasic;
use Syntax::Highlight::Engine::Kate::Python;
use Syntax::Highlight::Engine::Kate::Quake_Script;
use Syntax::Highlight::Engine::Kate::REXX;
use Syntax::Highlight::Engine::Kate::RPM_Spec;
use Syntax::Highlight::Engine::Kate::RSI_IDL;
use Syntax::Highlight::Engine::Kate::R_Script;
use Syntax::Highlight::Engine::Kate::RenderMan_RIB;
use Syntax::Highlight::Engine::Kate::Ruby;
use Syntax::Highlight::Engine::Kate::SGML;
use Syntax::Highlight::Engine::Kate::SML;
use Syntax::Highlight::Engine::Kate::SQL;
use Syntax::Highlight::Engine::Kate::SQL_MySQL;
use Syntax::Highlight::Engine::Kate::SQL_PostgreSQL;
use Syntax::Highlight::Engine::Kate::Sather;
use Syntax::Highlight::Engine::Kate::Scheme;
use Syntax::Highlight::Engine::Kate::Scilab;
use Syntax::Highlight::Engine::Kate::Sieve;
use Syntax::Highlight::Engine::Kate::Spice;
use Syntax::Highlight::Engine::Kate::Stata;
use Syntax::Highlight::Engine::Kate::TI_Basic;
use Syntax::Highlight::Engine::Kate::Tcl_Tk;
use Syntax::Highlight::Engine::Kate::Txt2tags;
use Syntax::Highlight::Engine::Kate::UnrealScript;
use Syntax::Highlight::Engine::Kate::VHDL;
use Syntax::Highlight::Engine::Kate::VRML;
use Syntax::Highlight::Engine::Kate::Velocity;
use Syntax::Highlight::Engine::Kate::Verilog;
use Syntax::Highlight::Engine::Kate::WINE_Config;
use Syntax::Highlight::Engine::Kate::XHarbour;
use Syntax::Highlight::Engine::Kate::XML;
use Syntax::Highlight::Engine::Kate::XML_Debug;
use Syntax::Highlight::Engine::Kate::Xslt;
use Syntax::Highlight::Engine::Kate::Yacas;
use Syntax::Highlight::Engine::Kate::Yacc_Bison;
# end uselist

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my %args = (@_);
	
	my $add = delete $args{'plugins'};
	unless (defined($add)) { $add = [] };
	my $substitutions = delete $args{'substitutions'};
	unless (defined($substitutions)) { $substitutions = {} };
	my $formattable = delete $args{'format_table'};
	unless (defined($formattable)) { $formattable = {} };
	my $language = delete $args{'language'};
	unless (defined($language)) { $language = 'Off' };
	
	my @plugs = (@$add, 
		#[module, language, extensions, section],
		['AHDL', 'AHDL', '*.ahdl;*.tdf', 'Hardware'],
		['ANSI_C89', 'ANSI C89', '*.c;*.C;*.h', 'Sources'],
		['ASP', 'ASP', '*.asp;', 'Markup'],
		['AVR_Assembler', 'AVR Assembler', '*.asm;*.ASM;*.asm-avr', 'Assembler'],
		['AWK', 'AWK', '*.awk', 'Scripts'],
		['Ada', 'Ada', '*.adb;*.ads;*.ada;*.a', 'Sources'],
		['Alerts', 'Alerts', '', 'hidden'],
		['Asm6502', 'Asm6502', '*.asm', 'Assembler'],
		['BaseTest', 'BaseTest', '*.basetest;', 'Test'],
		['BaseTestchild', 'BaseTestchild', '*.tst;', 'Test'],
		['Bash', 'Bash', '*.sh;*.bash;*.ebuild;*.eclass', 'Scripts'],
		['BibTeX', 'BibTeX', '*.bib', 'Markup'],
		['C', 'C', '*.c;*.C;*.h', 'Sources'],
		['CGiS', 'CGiS', '*.cgis', 'Sources'],
		['CMake', 'CMake', 'CMakeLists.txt;*.cmake;', 'Other'],
		['CSS', 'CSS', '*.css', 'Markup'],
		['CUE_Sheet', 'CUE Sheet', '*.cue', 'Other'],
		['Cdash', 'C#', '*.cs', 'Sources'],
		['Cg', 'Cg', '*.cg', 'Sources'],
		['ChangeLog', 'ChangeLog', 'ChangeLog', 'Other'],
		['Cisco', 'Cisco', '*.cis', 'Configuration'],
		['Clipper', 'Clipper', '*.prg;*.PRG;*.ch', 'Sources'],
		['ColdFusion', 'ColdFusion', '*.cfm;*.cfc;*.cfml;*.dbm', 'Markup'],
		['Common_Lisp', 'Common Lisp', '*.lisp;*.cl;*.lsp', 'Scripts'],
		['ComponentminusPascal', 'Component-Pascal', '*.cp;*.bro', 'Sources'],
		['Cplusplus', 'C++', '*.cxx;*.cpp;*.cc;*.C;*.h;*.H;*.hxx;*.hpp;*.hcc;*.moc', 'Sources'],
		['D', 'D', '*.d;*.D', 'Sources'],
		['Debian_Changelog', 'Debian Changelog', '', 'Other'],
		['Debian_Control', 'Debian Control', '', 'Other'],
		['Desktop', '.desktop', '*.desktop;*.kdelnk', 'Configuration'],
		['Diff', 'Diff', '*.diff;*patch', 'Other'],
		['Doxygen', 'Doxygen', '*.dox;*.doxygen', 'Markup'],
		['E_Language', 'E Language', '*.e', 'Sources'],
		['Eiffel', 'Eiffel', '*.e', 'Sources'],
		['Euphoria', 'Euphoria', '*.e;*.ex;*.exw;*.exu', 'Scripts'],
		['Ferite', 'ferite', '*.fe;*.feh', 'Scripts'],
		['Fortran', 'Fortran', '*.f;*.F;*.for;*.FOR;*.f90;*.F90;*.fpp;*.FPP;*.f95;*.F95;', 'Sources'],
		['FourGL', '4GL', '*.4gl;*.4GL;*.err', 'Database'],
		['FourGLminusPER', '4GL-PER', '*.per;*.PER;*.per.err', 'Database'],
		['GDL', 'GDL', '*.gdl;*.vcg;*.GDL;*.VCG', 'Scientific'],
		['GLSL', 'GLSL', '*.glsl', 'Sources'],
		['GNU_Assembler', 'GNU Assembler', '*.s;*.S', 'Assembler'],
		['GNU_Gettext', 'GNU Gettext', '*.po;*.pot', 'Markup'],
		['HTML', 'HTML', '*.htm;*.html;*.shtml;*.shtm', 'Markup'],
		['Haskell', 'Haskell', '*.hs', 'Sources'],
		['IDL', 'IDL', '*.idl', 'Sources'],
		['ILERPG', 'ILERPG', 'QRPGLESRC.*', 'Sources'],
		['INI_Files', 'INI Files', '*.ini;*.pls', 'Configuration'],
		['Inform', 'Inform', '*.inf;*.h', 'Sources'],
		['Intel_x86_NASM', 'Intel x86 (NASM)', '*.asm', 'Assembler'],
		['JSP', 'JSP', '*.jsp;*.JSP', 'Markup'],
		['Java', 'Java', '*.java', 'Sources'],
		['JavaScript', 'JavaScript', '*.js', 'Scripts'],
		['Javadoc', 'Javadoc', '', 'Markup'],
		['KBasic', 'KBasic', '*.kbasic', 'Sources'],
		['LDIF', 'LDIF', '*.ldif', 'Database'],
		['LPC', 'LPC', '*.c;*.h;*.inc;*.o', 'Sources'],
		['LaTeX', 'LaTeX', '*.tex; *.ltx; *.dtx; *.sty; *.cls;', 'Markup'],
		['Lex_Flex', 'Lex/Flex', '*.l;*.lex;*.flex', 'Sources'],
		['LilyPond', 'LilyPond', '*.ly;*.LY', 'Other'],
		['Literate_Haskell', 'Literate Haskell', '*.lhs', 'Sources'],
		['Lua', 'Lua', '*.lua', 'Scripts'],
		['MABminusDB', 'MAB-DB', '*.mab;*.MAB;*.Mab', 'Markup'],
		['MIPS_Assembler', 'MIPS Assembler', '*.s;', 'Assembler'],
		['Makefile', 'Makefile', '*makefile*;*Makefile*', 'Other'],
		['Mason', 'Mason', '*.html;', 'Scripts'],
		['Matlab', 'Matlab', '*.m;*.M', 'Scientific'],
		['Modulaminus2', 'Modula-2', '*.mod;*.def;*.mi;*.md', 'Sources'],
		['Music_Publisher', 'Music Publisher', '*.mup;*.not', 'Other'],
		['Octave', 'Octave', '*.octave;*.m;*.M', 'Scientific'],
		['PHP_HTML', 'PHP (HTML)', '*.php;*.php3;*.wml;*.phtml;*.phtm;*.inc', 'Scripts'],
		['PHP_PHP', 'PHP/PHP', '', 'hidden'],
		['POVminusRay', 'POV-Ray', '*.inc;*.pov', 'Other'],
		['Pascal', 'Pascal', '*.pp;*.pas;*.p', 'Sources'],
		['Perl', 'Perl', '*.pl;*.pm', 'Scripts'],
		['PicAsm', 'PicAsm', '*.src;*.SRC;*.asm;*.ASM;*.pic;*.PIC', 'Assembler'],
		['Pike', 'Pike', '*.pike', 'Scripts'],
		['PostScript', 'PostScript', '*.ps;*.ai;*.eps', 'Markup'],
		['Progress', 'progress', '*.p;*.w;*.i', 'Database'],
		['Prolog', 'Prolog', '*.prolog', 'Sources'],
		['PureBasic', 'PureBasic', '*.pb', 'Sources'],
		['Python', 'Python', '*.py;*.pyw', 'Scripts'],
		['Quake_Script', 'Quake Script', '*.cfg', 'Scripts'],
		['REXX', 'REXX', '*.rex', 'Scripts'],
		['RPM_Spec', 'RPM Spec', '*.spec', 'Other'],
		['RSI_IDL', 'RSI IDL', '*.pro', 'Sources'],
		['R_Script', 'R Script', '*.R', 'Scripts'],
		['RenderMan_RIB', 'RenderMan RIB', '*.rib', 'Other'],
		['Ruby', 'Ruby', '*.rb', 'Scripts'],
		['SGML', 'SGML', '*.sgml', 'Markup'],
		['SML', 'SML', '*.sml;*.ml', 'Sources'],
		['SQL', 'SQL', '*.sql;*.SQL', 'Database'],
		['SQL_MySQL', 'SQL (MySQL)', '*.sql;*.SQL', 'Database'],
		['SQL_PostgreSQL', 'SQL (PostgreSQL)', '*.sql;*.SQL', 'Database'],
		['Sather', 'Sather', '*.sa', 'Sources'],
		['Scheme', 'Scheme', '*.scm;*.ss;*.scheme;*.guile', 'Scripts'],
		['Scilab', 'scilab', '*.sci;*.sce', 'Scientific'],
		['Sieve', 'Sieve', '*.siv', 'Scripts'],
		['Spice', 'Spice', '*.sp;*.hsp', 'Hardware'],
		['Stata', 'Stata', '*.ado;*.do', 'Sources'],
		['TI_Basic', 'TI Basic', '', 'Scientific'],
		['Tcl_Tk', 'Tcl/Tk', '*.tcl;*.tk', 'Scripts'],
		['Txt2tags', 'txt2tags', '*.t2t', 'Markup'],
		['UnrealScript', 'UnrealScript', '*.uc', 'Scripts'],
		['VHDL', 'VHDL', '*.vhdl;*.vhd', 'Hardware'],
		['VRML', 'VRML', '*.wrl', 'Markup'],
		['Velocity', 'Velocity', '*.vm;', 'Scripts'],
		['Verilog', 'Verilog', '*.v;*.V;*.vl', 'Hardware'],
		['WINE_Config', 'WINE Config', '*.reg', 'Configuration'],
		['XHarbour', 'xHarbour', '*.prg;*.PRG;*.ch', 'Sources'],
		['XML', 'XML', '*.docbook;*.xml;*.rc;*.daml;*.rdf', 'Markup'],
		['XML_Debug', 'XML (Debug)', '', 'Markup'],
		['Xslt', 'xslt', '*.xsl;*.xslt', 'Markup'],
		['Yacas', 'yacas', '*.ys', 'Sources'],
		['Yacc_Bison', 'Yacc/Bison', '*.y', 'Sources'],
	);
	my %sections = ();
	my %extensions = ();
	my %syntaxes = ();
	foreach my $pl (@plugs) {
		my $plug = shift @$pl;
		my $lang = shift @$pl;
		my $ext = shift @$pl;
		my $sect = shift @$pl;
		unless (defined($sections{$sect})) {
			$sections{$sect} = [];
		}
		my $ref = $sections{$sect};
		push @$ref, $lang;
		my @exs = split /;/, $ext;
		foreach my $e (@exs) {
			unless (exists $extensions{$e}) {
				$extensions{$e} = [ $lang ];
			} else {
				my $a = $extensions{$e};
				push @$a, $lang;
			}
		}
		$syntaxes{$lang} = $plug;
	}

	my $self = {
		deliminators => '',
		extensions => \%extensions,
		format_table => $formattable,
		lastchar => '',
		linesegment => 1,
		plugin => undef,
		plugins => {},
		out => [],
		sections => \%sections,
		snippet => '',
		snippetattribute => '',
		stack => [],
		substitutions => $substitutions,
		syntaxes => \%syntaxes,
	};
	bless ($self, $class);
	if ($language ne '') {
		$self->language($language);
	}
	return $self;
}

sub column {
	my $self = shift;
	return length($self->linesegment);
}

sub contextParse {
	my ($self, $plug, $context) = @_;
	if ($context =~ /^#pop/i) {
		while ($context =~ s/#pop//i) {
			$self->stackPull;
		}
	} elsif ($context =~ /^#stay/i) {
		#don't do anything 
	} elsif ($context =~ /^##(.+)/) {
		my $new = $self->pluginGet($1);
		$self->stackPush([$new, $new->basecontext]);
	} else {
		$self->stackPush([$plug, $context]);
	}
}

sub extensions {
	my $self = shift;
	return $self->{'extensions'};
}

sub firstnonspace {
	my ($self, $string) = @_;
	my $line = $self->linesegment;
	if (($line =~ /^\s*$/) and ($string =~ /^[^\s]/)) {
		return 1
	}
	return ''
}

sub formatTable {
	my $self = shift;
	if (@_) { $self->{'format_table'} = shift; };
	return $self->{'format_table'};
}

sub highlight {
	my ($self, $text) = @_;
	$self->snippet('');
	my $out = $self->out;
	@$out = ();
	while ($text ne '') {
		my $top = $self->stackTop;
		if (defined($top)) {
			my ($plug, $context) = @$top;
			if ($text =~ s/^(\n)//) {
				$self->snippetForce;
				my $e = $plug->contextInfo($context, 'lineending');
				if (defined($e)) {
					$self->contextParse($plug, $e)
				}
				my $attr = $plug->attributes->{$plug->contextInfo($context, 'attribute')};
				$self->snippetParse($1, $attr);
				$self->snippetForce;
				$self->linesegment('');
				my $b = $plug->contextInfo($context, 'linebeginning');
				if (defined($b)) {
					$self->contextParse($plug, $b)
				}
			} else {
				my $sub = $plug->contextInfo($context, 'callback');
				my $result = &$sub($plug, \$text);
				unless($result) {
					my $f = $plug->contextInfo($context, 'fallthrough');
					if (defined($f)) {
						$self->contextParse($plug, $f);
					} else {
						$text =~ s/^(.)//;
						my $attr = $plug->attributes->{$plug->contextInfo($context, 'attribute')};
						$self->snippetParse($1, $attr);
					}
				}
			}
		} else {
			push @$out, length($text), 'Normal';
			$text = '';
		}
	}
	$self->snippetForce;
	return @$out;
}

sub highlightText {
	my ($self, $text) = @_;
	my $res = '';
	my @hl = $self->highlight($text);
	while (@hl) {
		my $f = shift @hl;
		my $t = shift @hl;
		unless (defined($t)) { $t = 'Normal' }
		my $s = $self->substitutions;
		my $rr = '';
		while ($f ne '') {
			my $k = substr($f , 0, 1);
			$f = substr($f, 1, length($f) -1);
			if (exists $s->{$k}) {
				 $rr = $rr . $s->{$k}
			} else {
				$rr = $rr . $k;
			}
		}
		my $rt = $self->formatTable;
		if (exists $rt->{$t}) {
			my $o = $rt->{$t};
			$res = $res . $o->[0] . $rr . $o->[1];
		} else {
			$res = $res . $rr;
			warn "undefined format tag '$t'";
		}
	}
	return $res;
}

sub language {
	my $self = shift;
	my $plug;
	if (@_) {
		$self->reset;
		my $language = shift;
		if ($language eq 'Off') {
			$self->stack([]);
		} else {
			$plug	= $self->pluginGet($language);
			my $basecontext = $plug->basecontext;
			my $lang = $plug->language;
			$self->stack([
				[$plug, $basecontext]
			]);
		}
	}
	if (defined($plug)) {
		return $plug->language;
	};
}

sub languageList {
	my $self = shift;
	my $l = $self->{'syntaxes'};
	return sort keys %$l;
}

sub languagePlug {
	my ($self, $req) = @_;
	unless (exists($self->{'syntaxes'}->{$req})) {
		warn "undefined language: $req";
		return undef;
	}
	return $self->{'syntaxes'}->{$req};
}

sub lastchar {
	my $self = shift;
	my $l = $self->linesegment;
	if ($l eq '') { return "\n" } #last character was a newline
	return substr($l, length($l) - 1, 1);
}

sub lastcharDeliminator {
	my $self = shift;
	my $deliminators =  '\s|\~|\!|\%|\^|\&|\*|\+|\(|\)|-|=|\{|\}|\[|\]|:|;|<|>|,|\\|\||\.|\?|\/';
	if ($self->linestart or ($self->lastchar =~ /$deliminators/))  {
		return 1;
	}
	return '';
}

sub linesegment {
	my $self = shift;
	if (@_) { $self->{'linesegment'} = shift; };
	return $self->{'linesegment'};
}

sub linestart {
	my $self = shift;
	if ($self->linesegment eq '') {
		return 1
	}
	return '';
}

sub out {
	my $self = shift;
	if (@_) { $self->{'out'} = shift; }
	return $self->{'out'};
}

sub pluginGet {
	my ($self, $language) = @_;
	my $plugs = $self->{'plugins'};
	unless (exists($plugs->{$language})) {
		my $modname = $self->languagePlug($language);
		unless (defined($modname)) {
			warn "no valid module found for language '$language'";
			return undef;
		}
		my $plug;
		eval "\$plug = new Syntax::Highlight::Engine::Kate::$modname(\$self)";
		if (defined($plug)) {
			$plugs->{$language} = $plug;
		} else {
			warn "cannot create plugin for language '$language'\n$@";
		}
	}
	if (exists($plugs->{$language})) {
		return $plugs->{$language};
	} 
	return undef;
}

sub reset {
	my $self = shift;
	my $stack = $self->stack;
	if (@$stack) {
		my $top = $stack->[0];
		$self->stack([$top]);
	}
	$self->out([]);
	$self->snippet('');
}

sub sections {
	my $self = shift;
	return $self->{'sections'};
}

sub snippet {
	my $self = shift;
	if (@_) { $self->{'snippet'} = shift; }
	return $self->{'snippet'};
}

sub snippetAppend {
	my ($self, $ch) = @_;
	$self->{'snippet'} = $self->{'snippet'} . $ch;
	if ($ch ne '') {
		$self->linesegment($self->linesegment . $ch);
	}
}

sub snippetAttribute {
	my $self = shift;
	if (@_) { $self->{'snippetattribute'} = shift; }
	return $self->{'snippetattribute'};
}

sub snippetForce {
	my $self = shift;
	my $parse = $self->snippet;
	if ($parse ne '') {
		my $out = $self->{'out'};
		push(@$out, $parse, $self->snippetAttribute);
		$self->snippet('');
	}
}

sub snippetParse {
	my $self = shift;
	my $snip = shift;
	my $attr = shift;
	if ((defined $attr) and ($attr ne $self->snippetAttribute)) { 
		$self->snippetForce;
		$self->snippetAttribute($attr);
	}
	$self->snippetAppend($snip);
}

sub stack {
	my $self = shift;
	if (@_) { $self->{'stack'} = shift; }
	return $self->{'stack'};
}

sub stackPush {
	my ($self, $val) = @_;
	my $stack = $self->stack;
	unshift(@$stack, $val);
}

sub stackPull {
	my ($self, $val) = @_;
	my $stack = $self->stack;
	return shift(@$stack);
}

sub stackTop {
	my $self = shift;
	return $self->stack->[0];
}

sub stateCompare {
	my ($self, $state) = @_;
	my $h = [ $self->stateGet ];
	my $equal = 0;
	if (Dumper($h) eq Dumper($state)) { $equal = 1 };
	return $equal;
}

sub stateGet {
	my $self = shift;
	my $s = $self->stack;
	return @$s;
}

sub stateSet {
	my $self = shift;
	my $s = $self->stack;
	@$s = (@_);
}

sub substitutions {
	my $self = shift;
	if (@_) { $self->{'substitutions'} = shift; }
	return $self->{'substitutions'};
}


1;

__END__

