#!/bin/bash
WD="$(cd "$(dirname "$0")" && pwd)"
picomConfigDir="/home/$(whoami)/.config/picom/"
xfcePanelConfigDir="/home/$(whoami)/.config/xfce4/xfconf/xfce-perchannel-xml/"
dwmWallpaperDir="/home/$(whoami)/Pictures/Wallpapers"

unresolvedDependencies=false

for package in "picom" "xfce4-panel" "feh"; do 
	if ! command -v "$package"; then
		echo "$package needs to be installed"
		unresolvedDependencies=true
	fi
done

if $unresolvedDependencies; then
	exit
fi

git submodule init
git submodule update

cd $WD/dmenu
sudo make clean install
cd $WD/st
sudo make clean install
cd $WD
sudo make clean install

mkdir --parents $dwmWallpaperDir
wget "https://r4.wallpaperflare.com/wallpaper/906/970/555/digital-art-eclipse-clouds-berserk-wallpaper-c970584d01facd0b06a7688f9071767d.jpg" -O $dwmWallpaperDir/wallpaper.jpg;

mkdir --parents $xfcePanelConfigDir
cp $WD/xfce4-panel.xml $xfcePanelConfigDir/xfce4-panel.xml

mkdir --parents $picomConfigDir
cp $WD/picom.conf $picomConfigDir/picom.conf

cp $WD/xinitrc ~/.xinitrc
