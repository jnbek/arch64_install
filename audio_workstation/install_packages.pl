#!/usr/bin/perl 
# Install all the packages for my Arch Linux Digital Audio Workstation

use strict;
use warnings;
use Data::Dumper;
die "Horrible Death!!: This script requires root/sudo permissions" if $> > 0;
my @aur_fail    = ();
my $filter      = q!/usr/bin/perl -p -i -e 's/^.*\/(.*).+/$1/xs' | /bin/sed -e's/\s.*//'!;
my $repo_update = system( '/usr/bin/yaourt', '-Syy' );
my $ttf         = `/usr/bin/pacman -Ss ttf- |  $filter`;
my $gstreamer   = `/usr/bin/pacman -Ss gstreamer0.10- |  $filter`;

my @meta_pkgs = split( /\n/, $gstreamer . $ttf );

my @pacman_pkgs = qw(
  abs
  dbus-glib
  python-dbus
  whois
  dnsutils
  xorg-utils
  ack
  audacity
  audacious
  ardour
  libffado
  libflashsupport-jack
  alsa-plugins
  steinberg-asio
  steinberg-vst
  steinberg-vst24
  ati-dri
  audex
  aurvote
  cabextract
  cdrdao
  qjackctl
  jack2
  lib32-jack
  linux-rt-ice
  fsthost
  systemd-rtirq
  systemd-sysvcompat
  patchage
  ardour
  qtractor
  hydrogen
  rosegarden
  qsynth
  jsampler
  lmms
  ladspa-plugins
  dssi
  cifs-utils
  ctags
  customizepkg
  dvd+rw-tools
  easytag
  evince
  faac
  findutils
  flac
  flashplugin
  git
  google-chrome-dev
  gtk-theme-plastiq
  gvim
  htop
  icedtea-web-java7
  intel-dri
  jdk7-openjdk
  jre7-openjdk
  k3b
  lame
  lib32-ati-dri
  lib32-intel-dri
  lib32-nouveau-dri
  libgnomeui
  libgpod
  mate
  mate-extrasmesa
  mlocate
  multilib-devel
  network-manager-applet
  nfs-utils
  normalize
  nouveau-dri
  ntp
  openresolv
  openshot
  pacman-color
  perl
  perl-audio-flac-header
  perl-cpanplus-dist-arch-git
  rsync
  rxvt-unicode-patched
  screen
  smbclient
  sox
  strace
  subversion
  transcode
  ttf-mac-fonts
  ttf-ms-fonts
  ttf-vista-fonts
  unrar
  unzip
  vcdimager
  vimpager
  vorbis-tools
  weechat
  xf86-input-synaptics
  xf86-video-ati
  xf86-video-intel
  xf86-video-nouveau
  xorg-server-utils
  xorg-twm
  xorg-xclock
  xorg-xinit
  xosd
  xscreensaver
  xsel
  xterm
  xz
  zip
  zsh
);

my $pacman = join( ' ', sort ( @meta_pkgs, @pacman_pkgs, @programming_pkgs ) );
my @aur = sort ( @aur_pkgs, @programming_aur_pkgs );
my $install_pacman = system("/usr/bin/yaourt -S --needed $pacman");

## AUR Package are likely to fail, let's get as much done as possible...
foreach my $package (@aur) {
    my $return = system("/usr/bin/yaourt -S --noconfirm $package");
    if ( $return != 0 ) {
        push @aur_fail, $package;
    }
}
print "Failed AUR Packages:\n";
print Dumper( \@aur_fail );
