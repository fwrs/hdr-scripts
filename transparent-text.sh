#!/bin/bash -euo pipefail
nits="pow(${TEXT_PEAK_NITS:-10000}/10000,0.1593017578125)"
printf '%s' "$1" | magick \
  -background none \
  -fill white \
  -font /Library/Fonts/SF-Pro.ttf \
  -pointsize 72 \
  label:@- \
  -trim +repage \
  -resize x76 \
  -alpha extract \
  -background black \
  -gravity northwest \
  -extent '%[fx:ceil((w+10)/92)*92]x92-10-%[fx:floor((92-h)/2)]' \
  -alpha copy \
  -channel RGB -fx "pow((0.8359375+18.8515625*$nits)/(1+18.6875*$nits),78.84375)" +channel \
  -depth 16 \
  -profile 2020_profile.icc \
  -define png:color-type=6 \
  -define png:bit-depth=16 \
  -define png:preserve-iCCP=true \
  -crop 92x92 +repage \
  text%02d.png
