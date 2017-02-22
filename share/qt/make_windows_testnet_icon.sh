#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/zcoinclassic_testnet.png
ICON_DST=../../src/qt/res/icons/zcoinclassic_testnet.ico
convert ${ICON_SRC} -resize 16x16 zcoinclassic_testnet-16.png
convert ${ICON_SRC} -resize 32x32 zcoinclassic_testnet-32.png
convert ${ICON_SRC} -resize 48x48 zcoinclassic_testnet-48.png
convert zcoinclassic_testnet-16.png zcoinclassic_testnet-32.png zcoinclassic_testnet-48.png ${ICON_DST}
