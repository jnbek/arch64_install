#!/usr/bin/perl 
# Install all the packages for my Arch Linux Installs

use strict;
use warnings;
use Data::Dumper;
die "Horrible Death!!: This script requires root/sudo permissions" if $> > 0;
my @aur_fail    = ();
my $filter      = q!/usr/bin/perl -p -i -e 's/^.*\/(.*).+/$1/xs' | /bin/sed -e's/\s.*//'!;
my $repo_update = system( '/usr/bin/yaourt', '-Syy' );
my $gimp        = `/usr/bin/pacman -Ss gimp | /usr/bin/grep -v help | $filter`;
my $ttf         = `/usr/bin/pacman -Ss ttf- |  $filter`;
my $gstreamer   = `/usr/bin/pacman -Ss gstreamer0.10- |  $filter`;

my @meta_pkgs = split( /\n/, $gstreamer . $ttf . $gimp );

my @programming_pkgs =
  qw( anjuta anjuta-extras devhelp glade cython clojure django fpc gjs gprolog go jre7-openjdk jdk7-openjdk lazarus lua nodejs ocaml php python ruby scala tcl valgrind );

my @programming_aur_pkgs = qw( iolanguage-git bluej perl-cpanel-publicapi );

my @pacman_pkgs =
  qw( dbus-glib python-dbus whois python2-dbus xorg-utils abs ack ati-dri audex aurvote cabextract cdrdao cifs-utils clementine ctags cups customizepkg cvs dnstracer dnsutils dosfstools dvd+rw-tools easytag enchant faac filezilla findutils firefox flac flashplugin fuse fuseiso gdb gdm gecko-mediaplayer geoip ghostscript gimp-help-en git gramps graphviz guifications gvfs gvfs-afc gvfs-afp gvfs-gphoto2 gvfs-smb gvim htop hunspell hunspell-en icedtea-web-java7 inetutils intel-dri iputils k3b evince keepassx keychain lame lib32-ati-dri lib32-intel-dri lib32-nouveau-dri libgnomeui libgpod libreoffice libreoffice-en-US luakit mate mate-extras mercurial mesa mlocate multilib-devel network-manager-applet networkmanager-openvpn nfs-utils normalize nouveau-dri ntp openshot openresolv openvpn opera pacman-color perl-dbd-mysql perl-dbd-pg perl-dbd-sqlite perl-dbi perl-gtk2-sexy perl-gtk2-trayicon perl-gtk2-webkit perl-json perl-libwww perl-lwp-protocol-https perl-mp3-info perl-tidy perl-xml-rss perl-xml-sax-expat perl-xml-simple phonon phonon-gstreamer phonon-mplayer-git phonon-vlc pidgin python2-gtkspell pywebkitgtk quota-tools qtcurve-gtk2 rhythmbox rsync screen smbclient sox sshfs strace subversion terminator thunderbird tidyhtml tmux transcode unrar unzip vcdimager vimpager vlc vorbis-tools weechat xchat xf86-input-synaptics xf86-video-ati xf86-video-intel xf86-video-nouveau xmpppy xorg-server-utils xorg-twm xorg-xclock xorg-xinit xosd xscreensaver xsel xterm xz zip zsh zsnes );

my @aur_pkgs =
  qw( steam osmgpsmap pyexiv2 cutycapt-svn faenza-hotot-icon gimp-extras google-chrome-dev google-earth hotot-gtk3 lib32-nss-mdns lightning-bin mrxvt rhythmbox-plugin-coverart-browser rhythmbox-tray-icon-git nuvolaplayer perl-audio-flac-header perl-cgi-ex perl-cpanplus-dist-arch-git perl-critic perl-dbd-csv perl-devel-repl perl-gnome2-vte perl-html-query gtk-theme-plastiq perl-net-xwhois perl-rpc-xml perl-www-curl-simple perl-test-without-module perl-www-wikipedia psx qbittorrent-bin rhythmbox-equalizer-git rxvt-unicode-patched tclxosd ttf-mac-fonts ttf-ms-fonts ttf-vista-fonts xscreensaver-goban nodejs-uglify-js nodejs-jshint nodejs-recess );

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
my $gem_install = system('/usr/bin/gem install colortail');
#my $install_synergy = system('/usr/bin/yaourt -S synergy');
print "Failed AUR Packages:\n";
print Dumper( \@aur_fail );
