#!/usr/bin/perl

use strict;
use Time::HiRes qw(time);
use Term::ANSIColor;

use Syntax::Highlight::Engine::Kate;

my $cycles = 5;

my %langs = (
	'.desktop' => "highlight.desktop",
	'AHDL' => "highlight.ahdl",
	'ASP' => "highlight.asp",
	'AVR Assembler' => "highlight.asm",
	'AWK' => "highlight.awk",
	'Bash' => "highlight.sh",
	'BibTeX' => "highlight.bib",
	'C++' => "highlight.cpp",
	'CMake' => "highlight.cmake",
	'CSS' => "highlight.css",
	'Clipper' => "highlight.prg",
	'Common Lisp' => "highlight.lisp",
	'Doxygen' => "highlight.dox",
	'Eiffel' => "highlight.e",
	'Euphoria' => "highlight.exu",
	'Fortran' => "highlight.f90",
	'GLSL' => "highlight.glsl",
	'HTML' => "highlight.html",
	'Haskell' => "highlight.hs",
	'Intel x86 (NASM)' => "highlight.asm",
	'JSP' => "highlight.jsp",
	'Java' => "highlight.java",
	'JavaScript' => "highlight.js",
	'LaTeX' => "highlight.tex",
	'Lex/Flex' => "highlight.lex",
	'LilyPond' => "highlight.ly",
	'Literate Haskell' => "highlight.hs",
	'Matlab' => "highlight.m",
	'Octave' => "highlight.m",
	'PHP (HTML)' => "highlight.php",
	'POV-Ray' => "highlight.pov",
	'Perl' => "highlight.pl",
	'PicAsm' => "highlight.asm",
	'Pike' => "highlight.pike",
	'PostScript' => "highlight.ps",
	'PureBasic' => "highlight.pb",
	'Python' => "highlight.py",
	'Quake Script' => "highlight.rib",
	'Ruby' => "highlight.rb",
	'Scheme' => "highlight.scheme",
	'Spice' => "highlight.sp",
	'Stata' => "highlight.do",
	'Tcl/Tk' => "highlight.tcl",
	'UnrealScript' => "highlight.uc",
	'VRML' => "highlight.wrl",
	'XML' => "highlight.xml",
	'xslt' => "highlight.xsl",
	'yacas' => "highlight.y",
);

my $k = new Syntax::Highlight::Engine::Kate(
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

my %results = ();
my $cycle = 1;

while ($cycle <= $cycles) {
	foreach my $ln (@langl) {
		print "testing language $ln\n";
		my $fl = $langs{$ln};
		my $txt = "";
		open(TST, "<samples/$fl") or die "cannot open $fl";
		while (<TST>) { 
			$txt = $txt . $_; 
		};
		close TST;
		unless (exists $results{$ln}) {
			$results{$ln} = {
				size => length($txt),
				hlmax => 0,
				hlmin => '',
				hltot => 0,
				fmmax => 0,
				fmmin => '',
				fmtot => 0,
			};
		}
		my $r = $results{$ln};
		my $cs = $cycle * $r->{'size'};
		print "$cycle $ln $cs" . " bytes: \n"; 
		$k->language($ln);
		$k->reset;
		my $start1 = time;
#		print $txt;
		my @dummy = $k->highlight($txt);
		my $hlbench = time - $start1;
		$r->{'hltot'} = $r->{'hltot'} + $hlbench;
		if ($hlbench > $r->{'hlmax'}) {
			$r->{'hlmax'} = $hlbench
		};
		if (($r->{'hlmin'} eq '') or ($hlbench < $r->{'hlmin'})) {
			$r->{'hlmin'} = $hlbench
		}
		my $hltp = 0;
		if ($r->{'hltot'} > 0) {
			$hltp = int($cs / $r->{'hltot'});
		}
		print "highlighting hltot " . $r->{'hltot'} . " seconds, avg throughput $hltp bytes/second\n" ;
		$k->reset;
		my $start2 = time;
#		print $txt;
		my $rtxt = $k->highlightText($txt);
#		print $rtxt;
		my $fmbench = time - $start2;
		$r->{'fmtot'} = $r->{'fmtot'} + $fmbench;
		if ($fmbench > $r->{'fmmax'}) {
			$r->{'fmmax'} = $fmbench
		};
		if (($r->{'fmmin'} eq '') or ($fmbench < $r->{'fmmin'})) {
			$r->{'fmmin'} = $fmbench
		}
		my $fmtp = 0;
		if ($r->{'fmtot'} > 0) {
			$fmtp = int($cs / $r->{'fmtot'});
		}
		print "formatting fmtot " . $r->{'fmtot'} . " seconds, avg throughput $fmtp bytes/second\n";
	}
	$cycle ++;
}

my %modes = (
	hl => '\$kate->highlight',
	fm => '\$kate->highlightText',
);

print "\n====================================================\n";
print "BENCHMARK REPORT FOR Sybtax::Highlight::Engine::Kate\n";
print "====================================================\n\n";
foreach my $md ('hl', 'fm') {
	my $mt = $modes{$md};
	print "Report for $mt, done $cycles iterations.\n\n";
	print "language        size        min         max         total       throughput\n";
	print "                testfile    time        time        time        (bytes/second)\n\n";
	my $mintot = 0;
	my $maxtot = 0;
	my $tottot = 0;
	my $siztot = 0;
	foreach my $l (sort keys %results) {
		my $txt = $l;
		$txt = addspaces($txt, 16);
		my $r = $results{$l};
		$txt = $txt . $r->{'size'};
		$siztot = $siztot + $r->{'size'};
		$mintot = $mintot + $r->{$md . 'min'};
		$maxtot = $maxtot + $r->{$md . 'max'};
		$tottot = $tottot + $r->{$md . 'tot'};
		$txt = addspaces($txt, 28);
		$txt = $txt . sprintf("%4f", $r->{$md . 'min'});
		$txt = addspaces($txt, 40);
		$txt = $txt . sprintf("%4f", $r->{$md . 'max'});
		$txt = addspaces($txt, 52);
		$txt = $txt . sprintf("%4f", $r->{$md . 'tot'});
		$txt = addspaces($txt, 64);
		$txt = $txt . calcaverage($r->{'size'}, $r->{$md . 'tot'});
		print "$txt\n";
	}
	print "\n";
	my $txtt = addspaces('Totals', 16);
	$txtt = $txtt . $siztot;
	$txtt = addspaces($txtt, 28);
	$txtt = $txtt . sprintf("%4f", $mintot);
	$txtt = addspaces($txtt, 40);
	$txtt = $txtt . sprintf("%4f", $maxtot);
	$txtt = addspaces($txtt, 52);
	$txtt = $txtt . sprintf("%4f", $tottot);
	$txtt = addspaces($txtt, 64);
	$txtt = $txtt . calcaverage($siztot, $tottot);
	print "$txtt\n";
	my $txta = addspaces('Averages', 16);
	my $numlang = @langl;
	if ($numlang > 0) {
		$txta = $txta . int($siztot/$numlang);
		$txta = addspaces($txta, 28);
		$txta = $txta . sprintf("%4f", $mintot/$numlang);
		$txta = addspaces($txta, 40);
		$txta = $txta . sprintf("%4f", $maxtot/$numlang);
		$txta = addspaces($txta, 52);
		$txta = $txta . sprintf("%4f", $tottot/$numlang);
	}
	print"$txta\n";
	print "====================================================\n\n";
}

sub addspaces {
	my $t = shift;
	my $l = shift;
	while (length($t) < $l) {
		$t = "$t ";
	}
	return $t;
}

sub calcaverage {
	my ($size, $time) = @_;
	if ($time eq 0) {
		return 'division by 0'
	} else {
		return int(($cycles * $size)/$time);
	}
}