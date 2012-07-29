Arch Linux 64 Installation Assistant
==============

My Arch Linux 64bit Install 'Template'; A collection of scripts to ease the pain ;-)
I do not know that this sick obsession these days with Open Source developers having to take a great thing, and f**k it all up by making stupid and retarded changes. KDE with 4.0, Ubuntu with Unity, GNOME 3, Rhythmbox, Amarok, and now... Arch Linux goes and removes the perfectly fine Installation Framework (AIF) and decided to replace it with some shell scripts... WTF?!?? Really??!?? Anyways, I'm not going to take this lying down... This repo will represent a semi automated way to get Arch Linux installed, obviously this will be a work in progress and I hope one that has a short life, with the hope the Arch Linux devs will pull their heads out of their backsides and give us a real installer again. 

The install_pkgs.zsh script is obviously personalized to my needs, and very specific to my environment, but you may feel free to take this work and it's overall 'framework' and tailor it to your desired flavor.. I use zsh, I recommend everyone try it, and the *.zsh scripts won't work on bash/dash/sh, very little will not be written in zsh, only the pre-reboot installation script(s) will not require it.

This collection of scripts is made available under the terms of the WTFPL License and comes without warranty, if you blow up your system using this, I'll probably just laugh at you. Because I'm a pretentious jerk like that ;-) But seriously, I will update this as I install/remove packages (very frequently) and could in fact harm your system, in cases where you multiboot with proprietary operating systems or other unixen. So read the scripts and make sure you know what your doing before just wanton running... 

Finally, due to the personal nature and ease of customization, if you fork the code, I won't likely take Pull Requests, unless there's a major code improvement, as opposed to package contents... Sorry, but I'd just prefer to have you steal the code and make it your own. 

Requirements
==============

* Latest install media
* Latest mirrorlists (*)
* archlinuxfr and mate repos (*)
* git (duhh)
* perl
* zsh
* yaourt
* -
* (*) These will be either installed or Perl hacked into their resective places.
