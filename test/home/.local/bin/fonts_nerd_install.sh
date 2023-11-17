#!/usr/bin/bash

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

if [[ ! -d $HOME/.local/share/fonts ]]; then
    mkdir $HOME/.local/share/fonts
fi

if [[ ! -d $HOME/tmp ]]; then
    mkdir $HOME/tmp
fi

cd $HOME/tmp

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

for font in ${fonts[@]}
do

    ### tar.xz 👉 smaller archive size - less traffic
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$font.tar.xz
    tar xf $font.tar.xz -C $HOME/.local/share/fonts/$font/
    rm $font.tar.xz

    ### zip
    # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$font.zip
    # unzip $font.zip -d $HOME/.local/share/fonts/$font/
    # rm $font.zip


done

###############################
# Weather Icons & fonts 👉 https://github.com/erikflowers/weather-icons.git
###############################

fc-cache

printf "\e[1;32mInstallation complete!\e[0m\n"
exit 0
