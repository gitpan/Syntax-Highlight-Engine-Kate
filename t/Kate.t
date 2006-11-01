
use strict;
use Term::ANSIColor;

use Test;

my %langs = (
	'.desktop' => "highlight.desktop",
	'4GL' => "",
	'4GL-PER' => "",
	'AHDL' => "highlight.ahdl",
	'ANSI C89' => "",
	'ASP' => "highlight.asp",
	'AVR Assembler' => "highlight.asm",
	'AWK' => "highlight.awk",
	'Ada' => "",
	'Alerts' => "",
	'Asm6502' => "",
	'Bash' => "highlight.sh",
	'BibTeX' => "highlight.bib",
	'C' => "",
	'C#' => "",
	'C++' => "highlight.cpp",
	'CGiS' => "",
	'CMake' => "highlight.cmake",
	'CSS' => "highlight.css",
	'CUE Sheet' => "",
	'Cg' => "",
	'ChangeLog' => "",
	'Cisco' => "",
	'Clipper' => "highlight.prg",
	'ColdFusion' => "",
	'Common Lisp' => "highlight.lisp",
	'Component-Pascal' => "",
	'D' => "",
	'Debian Changelog' => "",
	'Debian Control' => "",
	'Diff' => "",
	'Doxygen' => "highlight.dox",
	#one of these two is wrong, Eiffel does not look good at all any way
	'E Language' => "highlight.e",
#	'E Language' => "",
	'Eiffel' => "highlight.e",
	'Euphoria' => "highlight.exu",
	'Fortran' => "highlight.f90",
	'GDL' => "",
	'GLSL' => "highlight.glsl",
	'GNU Assembler' => "",
	'GNU Gettext' => "",
	'HTML' => "highlight.html",
	'Haskell' => "highlight.hs",
	'IDL' => "",
	'ILERPG' => "",
	'INI Files' => "",
	'Inform' => "",
	'Intel x86 (NASM)' => "highlight.asm",
	'JSP' => "highlight.jsp",
	'Java' => "highlight.java",
	'JavaScript' => "highlight.js",
	'Javadoc' => "",
	'KBasic' => "",
	'LDIF' => "",
	'LPC' => "",
	'LaTeX' => "highlight.tex",
	'Lex/Flex' => "highlight.lex",
	'LilyPond' => "highlight.ly",
	'Literate Haskell' => "highlight.hs",
	'Lua' => "",
	'MAB-DB' => "",
	'MIPS Assembler' => "",
	'Makefile' => "",
	'Mason' => "",
	'Matlab' => "highlight.m",
	'Modula-2' => "",
	'Music Publisher' => "",
	'Octave' => "highlight.m",
	'PHP (HTML)' => "highlight.php",
	'PHP/PHP' => "",
	'POV-Ray' => "highlight.pov",
	'Pascal' => "",
	'Perl' => "highlight.pl",
	'PicAsm' => "highlight.asm",
	'Pike' => "highlight.pike",
	'PostScript' => "highlight.ps",
	'Prolog' => "",
	'PureBasic' => "highlight.pb",
	'Python' => "highlight.py",
	'Quake Script' => "highlight.rib",
	'R Script' => "",
	'REXX' => "",
	'RPM Spec' => "",
	'RSI IDL' => "",
	'RenderMan RIB' => "",
	'Ruby' => "highlight.rb",
	'SGML' => "",
	'SML' => "",
	'SQL' => "",
	'SQL (MySQL)' => "",
	'SQL (PostgreSQL)' => "",
	'Sather' => "",
	'Scheme' => "highlight.scheme",
	'Sieve' => "",
	'Spice' => "highlight.sp",
	'Stata' => "highlight.do",
	'TI Basic' => "",
	'Tcl/Tk' => "highlight.tcl",
	'UnrealScript' => "highlight.uc",
	'VHDL' => "",
	'VRML' => "highlight.wrl",
	'Velocity' => "",
	'Verilog' => "",
	'WINE Config' => "",
	'XML' => "highlight.xml",
	'XML (Debug)' => "",
	'Yacc/Bison' => "",
	'ferite' => "",
	'progress' => "",
	'scilab' => "",
	'txt2tags' => "",
	'xHarbour' => "",
	'xslt' => "highlight.xsl",
	'yacas' => "highlight.y",
);


my %filetypes = (
	'../some/path/index.html' => 'HTML',
	'Module.pm' => 'Perl',
	'c:\\Documents and Settings\\My Documents\\settings.xml' => 'XML',
);

my %options = (
	substitutions => {
		"\n" => color('reset') . "\n",
	},
	format_table => {
		Alert => [color('white bold on_green'), color('reset')],
		BaseN => [color('green'), color('reset')],
		BString => [color('red bold'), color('reset')],
		Char => [color('magenta'), color('reset')],
		Comment => [color('white bold on_blue'), color('reset')],
		DataType => [color('blue'), color('reset')],
		DecVal => [color('blue bold'), color('reset')],
		Error => [color('yellow bold on_red'), color('reset')],
		Float => [color('blue bold'), color('reset')],
		Function => [color('yellow bold on_blue'), color('reset')],
		IString => [color('red'), color('reset')],
		Keyword => [color('bold'), color('reset')],
		Normal => [color('reset'), color('reset')],
		Operator => [color('green'), color('reset')],
		Others => [color('yellow bold on_green'), color('reset')],
		RegionMarker => [color('black on_yellow bold'), color('reset')],
		Reserved => [color('magenta on_blue'), color('reset')],
		String => [color('red'), color('reset')],
		Variable => [color('blue on_red bold'), color('reset')],
		Warning => [color('green bold on_red'), color('reset')],
	},
);

my @langl = sort keys %langs;
my @ftl = sort keys %filetypes;
my $numtest = (@langl * 4) + 2 + (@ftl * 2);

plan tests => $numtest;
use Syntax::Highlight::Engine::Kate;
ok(1, 1 , "cannot find Kate");

my $k = new Syntax::Highlight::Engine::Kate(%options);
ok(defined($k), 1, "cannot create Kate");

for (@ftl) {
	my $l = $k->languagePropose($_);
	ok($l, $filetypes{$_}, "Cannot select correct filetype for $_");
	$k->languageAutoSet($_);
	ok($k->language, $filetypes{$_}, "Cannot select correct filetype for $_");
}

for (@langl) {
	my $ln = $_;
	print "testing $ln\n";
	my $md = $k->syntaxes->{$ln};
	my $mod = "Syntax::Highlight::Engine::Kate::$md";
	eval "use $mod";
	ok($@, "", "cannot find $mod");
	my $m = new $mod(%options);
	ok(defined($m), 1, "cannot create $mod");
	my $fl = $langs{$ln};
	if ($fl ne "") {
		my $txt = "";
		open(TST, "<samples/$fl") or die "cannot open $fl";
		while (<TST>) { 
			$txt = $txt . $_; 
		};
		close TST;
		my $res = "";
		print "testing as kate plugin\n";
		$k->language($ln);
		$k->reset;
		eval "\$res = \$k->highlightText(\$txt)";
		ok($@, "", "errors when highlighting");
		print $res;
		print "testing standalone\n";
		eval "\$res = \$m->highlightText(\$txt)";
		ok($@, "", "errors when highlighting");
#		print $res;
	} else {
		skip(1, "no test file");
		skip(1, "no test file");
	}
}

