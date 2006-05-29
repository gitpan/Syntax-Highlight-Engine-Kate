# Copyright (c) 2005 Hans Jeuken. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

# This file was generated from the 'katexml/cisco.xml' file of the syntax highlight
# engine of the kate text editor (http://kate.kde.org

#kate xml version 1.10
#kate version 2.4
#kate author Raphaël GRAPINET
#generated: Sun May 28 21:18:24 2006, localtime

package Syntax::Highlight::Engine::Kate::Cisco;

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
		'Char' => 'Char',
		'Command' => 'Normal',
		'Comment' => 'Comment',
		'Decimal' => 'DecVal',
		'Float' => 'Float',
		'Keyword' => 'Keyword',
		'Normal Text' => 'Normal',
		'Operator' => 'Others',
		'Parameter' => 'Others',
		'String' => 'String',
		'Substitution' => 'Others',
	});
	$self->listAdd('commands',
		'aaa',
		'access-list',
		'address',
		'alias',
		'arp',
		'async-bootp',
		'banner',
		'boot',
		'bridge',
		'buffers',
		'busy-message',
		'call-history-mib',
		'cdp',
		'chat-script',
		'class-map',
		'clock',
		'cns',
		'config-register',
		'controller',
		'crypto',
		'default',
		'default-value',
		'dialer',
		'dialer-list',
		'dnsix-dmdp',
		'dnsix-nat',
		'downward-compatible-config',
		'enable',
		'end',
		'exception',
		'exit',
		'file',
		'frame-relay',
		'help',
		'hostname',
		'interface',
		'ip',
		'isdn',
		'isdn-mib',
		'kerberos',
		'key',
		'line',
		'logging',
		'login-string',
		'map-class',
		'map-list',
		'memory-size',
		'menu',
		'modemcap',
		'multilink',
		'netbios',
		'no',
		'ntp',
		'partition',
		'policy-map',
		'priority-list',
		'privilege',
		'process-max-time',
		'prompt',
		'queue-list',
		'resume-string',
		'rlogin',
		'rmon',
		'route-map',
		'router',
		'rtr',
		'scheduler',
		'service',
		'snmp-server',
		'sntp',
		'stackmaker',
		'state-machine',
		'subscriber-policy',
		'tacacs-server',
		'template',
		'terminal-queue',
		'tftp-server',
		'time-range',
		'username',
		'virtual-profile',
		'virtual-template',
		'vpdn',
		'vpdn-group',
		'x25',
		'x29',
	);
	$self->listAdd('options',
		'accounting',
		'accounting-list',
		'accounting-threshold',
		'accounting-transits',
		'address-pool',
		'as-path',
		'audit',
		'auth-proxy',
		'authentication',
		'authorization',
		'bgp-community',
		'bootp',
		'cef',
		'classless',
		'community-list',
		'default-gateway',
		'default-network',
		'dhcp',
		'dhcp-server',
		'domain-list',
		'domain-lookup',
		'domain-name',
		'dvmrp',
		'exec-callback',
		'extcommunity-list',
		'finger',
		'flow-aggregation',
		'flow-cache',
		'flow-export',
		'forward-protocol',
		'ftp',
		'gratuitous-arps',
		'host',
		'host-routing',
		'hp-host',
		'http',
		'icmp',
		'inspect',
		'local',
		'mrm',
		'mroute',
		'msdp',
		'multicast',
		'multicast-routing',
		'name-server',
		'nat',
		'new-model',
		'ospf',
		'password',
		'password-encryption',
		'pgm',
		'pim',
		'port-map',
		'prefix-list',
		'radius',
		'rcmd',
		'reflexive-list',
		'route',
		'routing',
		'rsvp',
		'rtcp',
		'sap',
		'sdr',
		'security',
		'source-route',
		'subnet-zero',
		'tacacs',
		'tcp',
		'tcp-small-servers',
		'telnet',
		'tftp',
		'timestamps',
		'udp-small-servers',
		'vrf',
		'wccp',
	);
	$self->listAdd('parameters',
		'accounting',
		'accounting-list',
		'accounting-threshold',
		'accounting-transits',
		'address-pool',
		'as-path',
		'audit',
		'auth-proxy',
		'authentication',
		'authorization',
		'bgp-community',
		'bootp',
		'cef',
		'classless',
		'community-list',
		'default-gateway',
		'default-network',
		'dhcp',
		'dhcp-server',
		'domain-list',
		'domain-lookup',
		'domain-name',
		'dvmrp',
		'exec-callback',
		'extcommunity-list',
		'finger',
		'flow-aggregation',
		'flow-cache',
		'flow-export',
		'forward-protocol',
		'ftp',
		'gratuitous-arps',
		'host',
		'host-routing',
		'hp-host',
		'http',
		'icmp',
		'inspect',
		'local',
		'mrm',
		'mroute',
		'msdp',
		'multicast',
		'multicast-routing',
		'name-server',
		'nat',
		'new-model',
		'ospf',
		'password',
		'password-encryption',
		'pgm',
		'pim',
		'port-map',
		'prefix-list',
		'radius',
		'rcmd',
		'reflexive-list',
		'route',
		'routing',
		'rsvp',
		'rtcp',
		'sap',
		'sdr',
		'security',
		'source-route',
		'subnet-zero',
		'tacacs',
		'tcp',
		'tcp-small-servers',
		'telnet',
		'tftp',
		'timestamps',
		'udp-small-servers',
		'vrf',
		'wccp',
	);
	$self->contextdata({
		'Base' => {
			callback => \&parseBase,
			attribute => 'Normal Text',
		},
		'Parameter' => {
			callback => \&parseParameter,
			attribute => 'Parameter',
		},
		'Single Quote' => {
			callback => \&parseSingleQuote,
			attribute => 'String',
		},
		'String' => {
			callback => \&parseString,
			attribute => 'String',
		},
		'Substitution' => {
			callback => \&parseSubstitution,
			attribute => 'Substitution',
		},
	});
	$self->deliminators('\\s||\\.|\\(|\\)|:|\\!|\\+|,|-|<|=|>|\\%|\\&|\\*|\\/|;|\\?|\\[|\\]|\\^|\\{|\\||\\}|\\~|\\\\');
	$self->basecontext('Base');
	$self->keywordscase(1);
	bless ($self, $class);
	return $self;
}

sub language {
	return 'Cisco';
}

sub parseBase {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdone\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bdo\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\belif\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bif\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bfi\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\bcase\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\besac\\b', 1, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '[^()]+\\)', 1, 0, 0, 0, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, ';', ';', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '{', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '}', 0, 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'commands', 0, 0, undef, 0, '#stay', 'Command')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'parameters', 0, 0, undef, 0, '#stay', 'Parameter')) {
		return 1
	}
	# type => keyword
	if ($self->testKeyword($text, 'options', 0, 0, undef, 0, '#stay', 'Keyword')) {
		return 1
	}
	# type => Int
	if ($self->testInt($text, 0, 0, undef, 0, '#stay', 'Decimal')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[A-Za-z0-9_?{}!]+', 0, 0, 0, undef, 0, '#stay', 'Parameter')) {
		return 1
	}
	# type => RangeDetect
	if ($self->testRangeDetect($text, '"', '"', 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => AnyChar
	if ($self->testAnyChar($text, '|<>=;', 0, 0, undef, 0, '#stay', 'Operator')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, 'Single Quote', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, 'Substitution', 'Substitution')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '#', 0, 0, 0, undef, 0, '#stay', 'Normal Text')) {
		return 1
	}
	# type => RegExpr
	if ($self->testRegExpr($text, '#.*$', 0, 0, 0, undef, 0, '#stay', 'Comment')) {
		return 1
	}
	return 0;
};

sub parseParameter {
	my ($self, $text) = @_;
	# type => RegExpr
	if ($self->testRegExpr($text, '\\$[A-Za-z0-9_?]+', 0, 0, 0, undef, 0, '#pop', 'Parameter')) {
		return 1
	}
	return 0;
};

sub parseSingleQuote {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\'', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '\'', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parseString {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '"', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '"', 0, 0, 0, undef, 0, '#pop', 'String')) {
		return 1
	}
	return 0;
};

sub parseSubstitution {
	my ($self, $text) = @_;
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '\\', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => Detect2Chars
	if ($self->testDetect2Chars($text, '\\', '`', 0, 0, 0, undef, 0, '#stay', 'String')) {
		return 1
	}
	# type => DetectChar
	if ($self->testDetectChar($text, '`', 0, 0, 0, undef, 0, '#pop', 'Substitution')) {
		return 1
	}
	return 0;
};


1;

__END__

=head1 NAME

Syntax::Highlight::Engine::Kate::Cisco - a Plugin for Cisco syntax highlighting

=head1 SYNOPSIS

 require Syntax::Highlight::Engine::Kate::Cisco;
 my $sh = new Syntax::Highlight::Engine::Kate::Cisco([
 ]);

=head1 DESCRIPTION

Syntax::Highlight::Engine::Kate::Cisco is a  plugin module that provides syntax highlighting
for Cisco to the Syntax::Haghlight::Engine::Kate highlighting engine.

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

