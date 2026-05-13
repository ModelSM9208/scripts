#!/bin/bash
# ~/bin/print-label.sh
PRINTER="usb://0x04f9:0x20a7"
MODEL="QL-1100"
LABEL="103x164"
DIMS="1200x1822"

pdftoppm -png -r 300 "$1" /tmp/label_out
magick /tmp/label_out-1.png \
  -rotate 90 \
  -trim +repage \
  -resize ${DIMS} \
  -background white \
  -gravity center \
  -extent ${DIMS} \
  /tmp/label_final.png
brother_ql --backend pyusb --model $MODEL \
  --printer $PRINTER \
  print -l $LABEL /tmp/label_final.png
rm /tmp/label_out-1.png /tmp/label_final.png
