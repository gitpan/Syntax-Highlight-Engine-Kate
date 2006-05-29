# Copyright (c) 2004 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Syntax::Highlight::Engine::Kate::Template;

use vars qw($VERSION);
$VERSION = '0.01';

use strict;
use warnings;
use Data::Dumper;

#my $regchars = '\\^.$|()[]*+?';

sub new {
	my ($proto, $engine) = @_;
	my $class = ref($proto) || $proto;
	my $self = {};
	$self->{'attributes'} = {},
	$self->{'captured'} = [];
	$self->{'contextdata'} = {};
	$self->{'basecontext'} = '';
	$self->{'deliminators'} = '';
	$self->{'engine'} = $engine;
	$self->{'keywordcase'} = 1;
	$self->{'lists'} = {};
	$self->{'linestart'} = 1;
	$self->{'out'} = [];
	$self->{'snippet'} = '';
	$self->{'stack'} = [];
	bless ($self, $class);
	return $self;
}

sub attributes {
	my $self = shift;
	if (@_) { $self->{'attributes'} = shift; };
	return $self->{'attributes'};
}

sub basecontext {
	my $self = shift;
	if (@_) { $self->{'basecontext'} = shift; };
	return $self->{'basecontext'};
}

sub captured {
	my ($self, $c) = @_;
	if (defined($c)) {
		my $t = $self->engine->stackTop;
		my $n = 0;
		my @o = ();
		while (defined($c->[$n])) {
			push @o, $c->[$n];
			$n ++;
		}
		if (@o) {
			$t->[2] = \@o;
		}
	};
}

sub capturedGet {
	my ($self, $num) = @_;
	my $s = $self->engine->stack;
	if (defined($s->[1])) {
		my $c = $s->[1]->[2];
		$num --;
		if (defined($c)) {
			if (defined($c->[$num])) {
				my $r = $c->[$num];
				return $r;
			} else {
				warn "capture number $num not defined";
			}
		} else {
			warn "dynamic substitution is called for but nothing to substitute\n";
			return undef;
		}
	} else {
		warn "no parent context to take captures from";
	}
}

sub capturedParse {
	my ($self, $string, $mode) = @_;
	my $s = '';
	if (defined($mode)) {
		if ($string =~ s/^(\d)//) {
			$s = $self->capturedGet($1);
			if ($string ne '') {
				warn "character class is longer then 1 character, ignoring the rest";
			}
		}
	} else {
		while ($string ne '') {
			if ($string =~ s/^([^\%]*)\%(\d)//) {
				my $r = $self->capturedGet($2);
				if ($r ne '') {
					$s = $s . $1 . $r
				} else {
					$s = $s . $1 . '%' . $2;
					warn "target is an empty string";
				}
			} else {
				$string =~ s/^(.)//;
				$s = "$s$1";
			}
		}
	}
	return $s;
}

sub contextInfo {
	my ($self, $context, $item) = @_;
	if  (exists $self->contextdata->{$context}) {
		my $c = $self->contextdata->{$context};
		if (exists $c->{$item}) {
			return $c->{$item}
		} else {
			return undef;
		}
	} else {
		warn "undefined context '$context'";
		return undef;
	}
}

sub contextdata {
	my $self = shift;
	if (@_) { $self->{'contextdata'} = shift; };
	return $self->{'contextdata'};
}

sub deliminators {
	my $self = shift;
	if (@_) { $self->{'deliminators'} = shift; };
	return $self->{'deliminators'};
}

sub engine {
	my $self = shift;
	return $self->{'engine'};
}


sub includePlugin {
	my ($self, $language, $text) = @_;
	my $eng = $self->engine;
	my $plug = $eng->pluginGet($language);
	if (defined($plug)) {
		my $context = $plug->basecontext;
		my $call = $plug->contextInfo($context, 'callback');
		if (defined($call)) {
			return &$call($plug, $text);
		} else {
			warn "cannot find callback for context '$context'";
		}
	}
	return 0;
}

sub includeRules {
	my ($self, $context, $text) = @_;
	my $call = $self->contextInfo($context, 'callback');
	if (defined($call)) {
		return &$call($self, $text);
	} else {
		warn "cannot find callback for context '$context'";
	}
	return 0;
}

sub keywordscase {
	my $self = shift;
	if (@_) { $self->{'keywordcase'} = shift; }
	return $self->{'keywordscase'}
}

sub lists {
	my $self = shift;
	if (@_) { $self->{'lists'} = shift; }
	return $self->{'lists'}
}

sub listAdd {
	my $self = shift;
	my $listname = shift;
	my $lst = $self->lists;
	if (@_) {
		my @l = reverse sort @_;
		$lst->{$listname} = \@l;
	} else {
		$lst->{$listname} = [];
	}
}

sub parseResult {
	my ($self, $text, $string, $lahead, $column, $fnspace, $context, $attr) = @_;
	my $eng = $self->engine;
	if ($fnspace) {
		unless ($eng->firstnonspace($$text)) {
			return ''
		}
	}
	if (defined($column)) {
		if ($column ne $eng->column) {
			return '';
		}
	}
	unless ($lahead) {
		$$text = substr($$text, length($string));
		my $r;
		unless (defined($attr)) {
			my $t = $eng->stackTop;
			my ($plug, $ctext) = @$t;
			$r = $plug->attributes->{$plug->contextInfo($ctext, 'attribute')};
		} else {
			$r = $self->attributes->{$attr};
		}
		$eng->snippetParse($string, $r);
	}
	$eng->contextParse($self, $context);
	return 1
}

sub testAnyChar {
	my $self = shift;
	my $text = shift;
	my $string = shift;
	my $insensitive = shift;
	my $test = substr($$text, 0, 1);
	my $result;
	unless ($insensitive) {
		if (index($string, $test) > -1) {
			$result  = $test;
		}
	} else {
		if (index(lc($string), lc($test)) > -1) {
			$result  = $test;
		}
	}
	if (defined($result)) {
		return $self->parseResult($text, $result, @_);
	}
	return ''
}

sub testDetectChar {
	my $self = shift;
	my $text = shift;
	my $char = shift; 
	my $case = shift;
	my $dyn = shift;
	if ($dyn) {
		$char = $self->capturedParse($char, 1);
	}
	return $self->testStringDetect($text, $char, $case, 0, @_);
}

sub testDetect2Chars {
	my $self = shift;
	my $text = shift;
	my $char = shift; 
	my $char1 = shift;
	my $case = shift;
	my $dyn = shift;
	if ($dyn) {
		$char = $self->capturedParse($char, 1);
		$char1 = $self->capturedParse($char1, 1);
	}
	return $self->testStringDetect($text, "$char$char1", $case, 0, @_);
}

sub testDetectIdentifier {
	my $self = shift;
	my $text = shift;
	return $self->testRegExpr($text, "[a-zA-Z_][a-zA-Z0-9_]*", 0, 0, @_);
}

sub testDetectSpaces {
	my $self = shift;
	my $text = shift;
	return $self->testRegExpr($text, "\\s+", 0, 0, @_);
}

sub testFloat {
	my $self = shift;
	my $text = shift;
	if ($self->engine->lastcharDeliminator) {
		return $self->testRegExpr($text, '(?=\.?\d)\d*(?:\.\d*)?(?:[Ee][+-]?\d+)?', 0, @_);
#		return $self->testRegExpr($text, '(?=\.\d+)\d*(?:\.\d*)?(?:[Ee][+-]?\d+)?', 0, @_);
	}
	return ''
}

sub testHlCChar {
	my $self = shift;
	my $text = shift;
	return $self->testRegExpr($text, "'.'", 0, 0, @_);
}

sub testHlCHex {
	my $self = shift;
	my $text = shift;
	if ($self->engine->lastcharDeliminator) {
		return $self->testRegExpr($text, "0x[0-9a-fA-F]+", 0, 0, @_);
	}
	return ''
}

sub testHlCOct {
	my $self = shift;
	my $text = shift;
	if ($self->engine->lastcharDeliminator) {
		return $self->testRegExpr($text, "0[0-7]+", 0, 0, @_);
	}
	return ''
}

sub testHlCStringChar {
	my $self = shift;
	my $text = shift;
	if ($self->testRegExpr($text, '\\\\[a|b|e|f|n|r|t|v|\'|"|\?]', 0, 0, @_)) {
		return 1
	}
	if ($self->testRegExpr($text, '\\\\[0-7][0-7]?[0-7]?', 0, 0, @_)) {
		return 1
	} 
	if ($self->testRegExpr($text, '\\\\x[0-9a-fA-F][0-9a-fA-F]?', 0, 0, @_)) {
		return 1
	}
	return ''
}

sub testInt {
	my $self = shift;
	my $text = shift;
	if ($self->engine->lastcharDeliminator) {
		return $self->testRegExpr($text, "[+-]?\\d+", 0, @_);
	}
	return ''
}

sub testKeyword {
	my $self = shift;
	my $text = shift;
	my $list = shift;
	my $insensitive = shift;
	my $eng = $self->engine;
	unless (defined($insensitive)) {
		if ($self->keywordscase) {
			$insensitive = 0;
		} else {
			$insensitive = 1;
		}
	}
	my $deliminators = $self->deliminators;
	if (($eng->lastcharDeliminator)  and ($$text =~ /^([^$deliminators]+)/)) {
		my $match = $1;
		my $l = $self->lists->{$list};
		if (defined($l)) {
			my @list = @$l;
			my @rl = ();
			unless ($insensitive) {
				@rl = grep { (lc($match) eq lc($_)) } @list;
			} else {
				@rl = grep { ($match eq $_) } @list;
			}
			if (@rl) {
				return $self->parseResult($text, $match, @_);
			}
		} else {
			warn "list '$list' is not defined, failing test";
		}
	}
	return ''
}

sub testLineContinue {
	my $self = shift;
	my $text = shift;
	my $lahead = shift;
	if ($lahead) {
		if ($$text =~ /^\\\n/) {
			$self->parseResult($text, "\\", $lahead, @_);
			return 1;
		}
	} else {
		if ($$text =~ s/^(\\)(\n)/$2/) {
			return $self->parseResult($text, "\\", $lahead, @_);
		}
	}
	return ''
}

sub testRangeDetect {
	my $self = shift;
	my $text = shift;
	my $char = shift;
	my $char1 = shift;
	my $insensitive = shift;
	my $string = "$char\[^$char1\]+$char1";
	return $self->testRegExpr($text, $string, $insensitive, 0, @_);
}

sub testRegExpr {
	my $self = shift;
	my $text = shift;
	my $reg = shift;
	my $insensitive = shift;
	my $dynamic = shift;
	if ($dynamic) {
		$reg = $self->capturedParse($reg);
	}
	my $eng = $self->engine;
	if ($reg =~ s/^\^//) {
		unless ($eng->linestart) {
			return '';
		}
	} elsif ($reg =~ s/^\\(b)//i) {
		my $lastchar = $self->engine->lastchar;
		if ($1 eq 'b') {
			if ($lastchar =~ /\w/) { return '' }
		} else {
			if ($lastchar =~ /\W/) { return '' }
		}
	}
#	$reg = "^($reg)";
	$reg = "^$reg";
	my $pos;
	my @cap = ();
	my $sample = $$text;
	if ($insensitive) {
		if ($sample =~ /$reg/ig) {
			$pos = pos($sample);
			@cap = ($1, $2, $3, $4, $5, $6, $7, $8, $9);
		}
	} else {
		if ($sample =~ /$reg/g) {
			$pos = pos($sample);
			@cap = ($1, $2, $3, $4, $5, $6, $7, $8, $9);
		}
	}
	if (defined($pos) and ($pos > 0)) {
		$self->captured(\@cap);
		my $string = substr($$text, 0, $pos);
		return $self->parseResult($text, $string, @_);
	}
	return ''
}

sub testStringDetect {
	my $self = shift;
	my $text = shift;
	my $string = shift;
	my $insensitive = shift;
	my $dynamic = shift;
	if ($dynamic) {
		$string = $self->capturedParse($string);
	}
	my $test = substr($$text, 0, length($string));
	my $result;
	unless ($insensitive) {
		if ($test eq $string) {
			$result  = $test;
		}
	} else {
		if (lc($test) eq lc($string)) {
			$result  = $test;
		}
	}
	if (defined($result)) {
		return $self->parseResult($text, $result, @_);
	}
	return ''
}


1;

__END__

=cut

=head1 NAME

Syntax::Highlight::Engine::Kate::Template - a template for syntax highlighting plugins

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Template is a framework to assist authors of plugin modules.
All methods to provide highlighting to the Syntax::Highlight::Engine::Kate module are there, Just
no syntax definitions and callbacks. An instance of Syntax::Highlight::Engine::Kate::Template 
should never be created, it's meant to be sub classed only. 

=head1 METHODS

=over 4

=item B<attributes>(I<?$attributesref?>);

Sets and returns a reference to the attributes hash.

=item B<basecontext>(I<?$context?>);

Sets and returns the basecontext instance variable. This is the context that is used when highlighting starts.

=item B<captured>(I<$cap>);

Puts $cap in the first element of the stack, the current context. Used when the context is dynamic.

=item B<capturedGet>(I<$num>);

Returns the $num'th element that was captured in the current context.

=item B<capturedParse>(I<$string>, I<$mode>);

If B<$mode> is specified, B<$string> should only be one character long and numeric.
B<capturedParse> will return the Nth captured element of the current context.

If B<$mode> is not specified, all occurences of %[1-9] will be replaced by the captured
element of the current context.

=item B<contextInfo>(I<$context>, I<$item>);

returns the value of several context options. B<$item> can be B<callback>, B<attribute>, B<lineending>,
B<linebeginning>, B<fallthrough>.

=item B<contextdata>(I<\%data>);

Sets and returns a reference to the contextdata hash.

=item B<deliminators>(I<?$delim?>);

Sets and returns a string that is a regular expression for detecting deliminators.

=item B<engine>

Returns a reference to the Syntax::Highlight::Engine::Kate module that created this plugin.

=item B<includePlugin>(I<$language>, I<\$text>);

Includes the plugin for B<$language> in the highlighting.

=item B<includeRules>(I<$language>, I<\$text>);

Includes the plugin for B<$language> in the highlighting.

=item B<keywordscase>

Sets and returns the keywordscase instance variable.

=item B<listAdd>(I<'listname'>, I<$item1>, I<$item2> ...);

Adds a list to the 'lists' hash.

=item B<lists>(I<?\%lists?>);

sets and returns the instance variable 'lists'.

=item B<parseResult>(I<\$text>, I<$match>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

Called by every one of the test methods below. If the test matches, it will do a couple of subtests.
If B<$column> is a defined numerical value it will test if the process is at the requested column.
If B<$firnonspace> is true, it will test this also.
Ig it is not a look ahead and all tests are passed, B<$match> is then parsed and removed from B<$$text>.

=back

The methods below all return a boolean value.

=over 4

=item B<testAnyChar>(I<\$text>, I<$string>, I<$insensitive>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testDetectChar>(I<\$text>, I<$char>, I<$insensitive>, I<$dynamic>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testDetect2Chars>(I<\$text>, I<$char1>, I<$char2>, I<$insensitive>, I<$dynamic>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testDetectIdentifier>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testDetectSpaces>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testFloat>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testHlCChar>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testHlCHex>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testHlCOct>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testHlCStringChar>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testInt>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testKeyword>(I<\$text>, I<$list>, I<$insensitive>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testLineContinue>(I<\$text>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testRangeDetect>(I<\$text>,  I<$char1>, I<$char2>, I<$insensitive>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testRegExpr>(I<\$text>, I<$reg>, I<$insensitive>, I<$dynamic>, I<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=item B<testStringDetect>(I<\$text>, I<$string>, I<$insensitive>, I<$dynamic>, II<$lookahaed>, I<$column>, I<$firstnonspace>, I<$context>, I<$attribute>);

=back

=head1 ACKNOWLEDGEMENTS

All the people who wrote Kate and the syntax highlight xml files.

=head1 AUTHOR AND COPYRIGHT

This module is written and maintained by:

Hans Jeuken < haje at toneel dot demon dot nl >

Copyright (c) 2006 by Hans Jeuken, all rights reserved.

You may freely distribute and/or modify this module under same terms as
Perl itself 

=head1 SEE ALSO

Synax::Highlight::Engine::Kate http:://www.kate-editor.org

=cut













