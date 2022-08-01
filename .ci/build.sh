#!/bin/bash
set -e

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

sudo apt -y update
sudo apt-get -y install texlive texlive-latex-extra texlive-lang-czechslovak texlive-science texlive-pstricks latexmk texmaker texlive-font-utils texlive-fonts-extra texlive-bibtex-extra biber okular pdf-presenter-console dvipng sketch
sudo apt -y install poppler-utils imagemagick

pdflatex -interaction=nonstopmode main.tex
pdftoppm -jpeg main.pdf thumbnail.jpg
mkdir -p output
mv main.pdf output/presentation.pdf
mv montage-1.jpg output/montage-1.jpg
