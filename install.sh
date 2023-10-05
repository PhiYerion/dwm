#!/bin/bash
WD="$(cd "$(dirname "$0")" && pwd)"
xfcePanelConfigDir='~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml'
dwmWallpaperDir='~/Pictures/Wallpapers'

git submodule init
git submodule update

cd $WD/dmenu
sudo make clean install
cd $WD/st
sudo make clean install
cd $WD
sudo make clean install

mkdir --parents $dwmWallpaperDir
wget 'https://r4.wallpaperflare.com/wallpaper/906/970/555/digital-art-eclipse-clouds-berserk-wallpaper-c970584d01facd0b06a7688f9071767d.jpg' -O $dwmWallpaperDir/wallpaper.jpg;

mkdir --parents $xfcePanelConfigDir
cp $WD/xfce4-panel.xml $xfcePanelConfigDir/xfce4-panel.xml

cp $WD/xinitrc ~/.xinitrc
