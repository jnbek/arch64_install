#!/usr/bin/perl 

# Execute this after DAW packages
use strict;
use warnings;

use Data::Dumper;
use FindBin;
my $script = $FindBin::RealScript;
my @systemd_daemons = qw(
  NetworkManager
  alsa
  alsa-restore
  avahi-daemon
  avahi-dnsconfd
  cronie
  cups
  dbus
  gdm
  gdm
  nfsd
  ntpd
  rpcbind
  rtirq
  sshd.socket
  syslog-ng
);
my @etc = glob("$script/etc-files/*.conf");
