#!/bin/bash
WD="$(cd "$(dirname "$0")" && pwd)"

git submodules init
git submoduels update

cd $WD/dmenu
make clean install
cd $WD/st
make clean install
cd $WD
make clean install

wget 'https://r4.wallpaperflare.com/wallpaper/906/970/555/digital-art-eclipse-clouds-berserk-wallpaper-c970584d01facd0b06a7688f9071767d.jpg' -O ~/Pictures/wallpaper.jpg;

cp xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
