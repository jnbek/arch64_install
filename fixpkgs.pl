#!/usr/bin/perl 

use strict;
use warnings;
my $aur_hash = {};
my $all_hash = {};
my @pacman   = ();
#my @aur = qw(lightning-bin perl-critic perl-cgi-ex hotot-gtk3 iolanguage-git qbittorrent-bin psx xscreensaver-goban google-chrome-dev google-earth bluej perl-audio-flac-header autokey ttf-vista-fonts perl-gnome2-vte perl-dbd-csv ttf-ms-fonts rbwebkitgtk-git cutycapt-svn lib32-nss-mdns mrxvt rxvt-unicode-patched ttf-mac-fonts perl-www-curl-simple perl-net-xwhois gimp-extras perl-rpc-xml nuvolaplayer perl-html-query perl-cpanplus-dist-arch-git perl-www-wikipedia tclxosd );
my @aur = sort
  qw(lightning-bin perl-critic perl-cgi-ex hotot-gtk3 iolanguage-git qbittorrent-bin psx xscreensaver-goban google-chrome-dev google-earth bluej perl-audio-flac-header autokey ttf-vista-fonts perl-gnome2-vte perl-dbd-csv ttf-ms-fonts rbwebkitgtk-git cutycapt-svn lib32-nss-mdns mrxvt rxvt-unicode-patched ttf-mac-fonts perl-www-curl-simple perl-net-xwhois gimp-extras perl-rpc-xml nuvolaplayer perl-html-query perl-cpanplus-dist-arch-git perl-www-wikipedia tclxosd);
my @all = 
  qw(aurvote xf86-video-intel xf86-video-nouveau xf86-video-ati customizepkg rsync pacman-color abs network-manager-applet networkmanager-openvpn libreoffice libreoffice-en-US ati-dri nouveau-dri intel-dri cdrdao lib32-ati-dri lib32-nouveau-dri lib32-intel-dri multilib-devel firefox thunderbird pidgin terminator jre7-openjdk lightning-bin perl-tidy tidyhtml perl-critic icedtea-web-java7 perl-cgi-ex perl-json hotot-gtk3 qtcurve-gtk2 iolanguage-git git cvs zsh mercurial subversion gecko-mediaplayer easytag faac flac lame qbittorrent-bin psx zsnes xscreensaver xscreensaver-goban openvpn inetutils findutils iputils dnsutils nfs-utils cifs-utils smbclient ctags ruby ack htop tmux screen scala opera lazarus fpc python clojure google-chrome-dev google-earth lua php tcl bluej gdb ntp flashplugin vorbis-tools xchat enchant k3b audex vlc gprolog perl-dbi perl-xml-simple perl-xml-sax-expat perl-xml-rss perl-libwww perl-mp3-info guifications perl-audio-flac-header dvd+rw-tools nodejs strace libgpod gramps pywebkitgtk graphviz python2-gtkspell kdegraphics-okular kdesdk-kate autokey cabextract ttf-vista-fonts zip unzip unrar xz dnstracer perl-gtk2-webkit perl-gtk2-sexy perl-gtk2-trayicon geoip perl-gnome2-vte perl-dbd-mysql libgnomeui perl-dbd-pg gvim perl-dbd-sqlite perl-dbd-csv ruby-gtk2 ttf-ms-fonts rbwebkitgtk-git hunspell-en hunspell mlocate ruby-pkgconfig cups ghostscript cutycapt-svn vcdimager transcode sox normalize lib32-nss-mdns xsel mrxvt rxvt-unicode-patched ttf-mac-fonts slim xmpppy python-notify perl-gtk2-webkit fuse xorg-xinit openshot gvfs phonon phonon-gstreamer phonon-vlc  perl-www-curl-simple perl-net-xwhois phonon-mplayer-git valgrind gimp-help-en gimp-extras clementine luakit gvfs-afc gvfs-smb fuseiso xorg-twm xorg-xclock xterm mesa xorg-server-utils  gvfs-gphoto2 gvfs-afp perl-rpc-xml xosd nuvolaplayer sshfs keychain perl-html-query perl-cpanplus-dist-arch-git perl-www-wikipedia tclxosd perl-lwp-protocol-https weechat mate mate-extras);
foreach my $p (@all) {
    $all_hash->{$p} = $p;
}
foreach my $p (@aur) {
    $aur_hash->{$p} = $p;
}
foreach my $pk ( keys %{$all_hash} ) {
if ($aur_hash->{$pk}) {
    delete $all_hash->{$pk};
    next;
}
    push @pacman, $all_hash->{$pk};
}
print join( " ", sort @pacman );
print "\n\n\n";
print join( " ", @aur );
print "\n\n";
