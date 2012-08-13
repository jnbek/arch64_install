#!/bin/zsh
# Install all the packages for my Arch Linux Installs
yaourt -Syy; 
GMP=(`pacman -Ss gimp | grep -v help | perl -p -i -e 's/^.*\/(.*).+/$1/xs' | sed -e's/\s.*//'`); 
TTF=(`pacman -Ss ttf- |  perl -p -i -e 's/^.*\/(.*).+/$1/xs' | sed -e's/\s.*//'`); 
GST=(`pacman -Ss gstreamer0.10- |  perl -p -i -e 's/^.*\/(.*).+/$1/xs' | sed -e's/\s.*//'`);
PACMAN=( abs ack ati-dri audex aurvote cabextract cdrdao cifs-utils clementine clojure ctags cups customizepkg cvs dnstracer dnsutils dvd+rw-tools easytag enchant faac findutils firefox flac flashplugin fpc fuse fuseiso gdb gdm gecko-mediaplayer geoip ghostscript gimp-help-en git gprolog gramps graphviz guifications gvfs gvfs-afc gvfs-afp gvfs-gphoto2 gvfs-smb gvim htop hunspell hunspell-en icedtea-web-java7 inetutils intel-dri iputils jre7-openjdk k3b kdegraphics-okular kdesdk-kate keepassx keychain lame lazarus lib32-ati-dri lib32-intel-dri lib32-nouveau-dri libgnomeui libgpod libreoffice libreoffice-en-US lua luakit mate mate-extras mercurial mesa mlocate multilib-devel network-manager-applet networkmanager-openvpn nfs-utils nodejs normalize nouveau-dri ntp openshot openvpn opera pacman-color perl-dbd-mysql perl-dbd-pg perl-dbd-sqlite perl-dbi perl-gtk2-sexy perl-gtk2-trayicon perl-gtk2-webkit perl-json perl-libwww perl-lwp-protocol-https perl-mp3-info perl-tidy perl-xml-rss perl-xml-sax-expat perl-xml-simple phonon phonon-gstreamer phonon-mplayer-git phonon-vlc php pidgin python python-notify python2-gtkspell pywebkitgtk qtcurve-gtk2 rsync ruby ruby-gtk2 ruby-pkgconfig scala screen smbclient sox sshfs strace subversion tcl terminator thunderbird tidyhtml tmux transcode unrar unzip valgrind vcdimager vlc vorbis-tools weechat xchat xf86-input-synaptics xf86-video-ati xf86-video-intel xf86-video-nouveau xmpppy xorg-server-utils xorg-twm xorg-xclock xorg-xinit xosd xscreensaver xsel xterm xz zip zsh zsnes );

AUR=( autokey bluej cutycapt-svn gimp-extras google-chrome-dev google-earth hotot-gtk2 iolanguage-git lib32-nss-mdns lightning-bin mrxvt nuvolaplayer perl-audio-flac-header perl-cgi-ex perl-cpanplus-dist-arch-git perl-critic perl-dbd-csv perl-gnome2-vte perl-html-query perl-padre-plugin-perlcritic perl-padre-plugin-perltidy perl-net-xwhois perl-rpc-xml perl-www-curl-simple perl-www-wikipedia psx qbittorrent-bin rbwebkitgtk-git rxvt-unicode-patched tclxosd ttf-mac-fonts ttf-ms-fonts ttf-vista-fonts xscreensaver-goban );

yaourt -S --needed $GMP $TTF $GST $PACMAN
yaourt -S --noconfirm --needed $AUR
gem install colortail
# yaourt -S synergy