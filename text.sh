#!/bin/bash -euo pipefail
sdr=${SDR_WHITE_NITS:-203}
peak=${TEXT_PEAK_NITS:-10000}
nits="pow(($sdr+u*($peak-$sdr))/10000,0.1593017578125)"
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
  -fx "pow((0.8359375+18.8515625*$nits)/(1+18.6875*$nits),78.84375)" \
  -depth 16 \
  -profile 2020_profile.icc \
  -define png:color-type=2 \
  -define png:preserve-iCCP=true \
  -crop 92x92 +repage \
  text%02d.png
