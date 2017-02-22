#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/zcoinclassic.png
ICON_DST=../../src/qt/res/icons/zcoinclassic.ico
convert ${ICON_SRC} -resize 16x16 zcoinclassic-16.png
convert ${ICON_SRC} -resize 32x32 zcoinclassic-32.png
convert ${ICON_SRC} -resize 48x48 zcoinclassic-48.png
convert zcoinclassic-16.png zcoinclassic-32.png zcoinclassic-48.png ${ICON_DST}
