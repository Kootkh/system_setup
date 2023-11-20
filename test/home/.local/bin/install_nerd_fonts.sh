#!/usr/bin/bash
source ./funcs.sh

check_for_root_user

###############################
# NERD Fonts 👉 https://github.com/ryanoasis/nerd-fonts
###############################
#
# 3270
# Agave
# AnonymousPro
# Arimo
# AurulentSansMono
# BigBlueTerminal
# BitstreamVeraSansMono
# CascadiaCode
# CodeNewRoman
# ComicShannsMono
# Cousine
# DaddyTimeMono
# DejaVuSansMono
# DroidSansMono
# EnvyCodeR
# FantasqueSansMono
# FiraCode
# FiraMono
# Go-Mono
# Gohu
# Hack
# Hasklig
# HeavyData
# Hermit
# iA-Writer
# IBMPlexMono
# Inconsolata
# InconsolataGo
# InconsolataLGC
# IntelOneMono
# Iosevka
# IosevkaTerm
# JetBrainsMono
# Lekton
# Monofur
# Monoid
# Mononoki
# MPlus
# NerdFontsSymbolsOnly
# Noto
# OpenDyslexic
# Overpass
# ProFont
# ProggyClean
# RobotoMono
# ShareTechMono
# SourceCodePro
# SpaceMono
# Terminus
# Tinos
# Ubuntu
# UbuntuMono
# VictorMono

if [[ ! -d $real_user_home_dir/.local/share/fonts ]]; then
    mkdir $real_user_home_dir/.local/share/fonts
fi

if [[ ! -d $real_user_home_dir/.tmp ]]; then
    mkdir $real_user_home_dir/.tmp
fi

cd $real_user_home_dir/.tmp

fonts=(
"FiraCode"
"Go-Mono"
"Hack"
"Inconsolata"
"Iosevka"
"JetBrainsMono"
"Mononoki"
"RobotoMono"
"SourceCodePro"
"Terminus"
"DaddyTimeMono"
)

NERDFONTS_VERSION=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

#echo "NERDFONTS_VERSION => $NERDFONTS_VERSION"

for font in ${fonts[@]}
do

    ### tar.xz 👉 smaller archive size - less traffic
    #wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$font.tar.xz
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v$NERDFONTS_VERSION/$font.tar.xz
    if [[ ! -d $real_user_home_dir/.local/share/fonts/$font ]]; then
        mkdir $real_user_home_dir/.local/share/fonts/$font
    fi
    tar xf $font.tar.xz -C $real_user_home_dir/.local/share/fonts/$font/
    #rm $font.tar.xz
    rm $font.*

    ### zip
    # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$font.zip
    # unzip $font.zip -d $real_user_home_dir/.local/share/fonts/$font/
    # rm $font.zip


done

###############################
# Weather Icons & fonts 👉 https://github.com/erikflowers/weather-icons.git
###############################

fc-cache

printf "\e[1;32mInstallation complete!\e[0m\n"
exit 0
