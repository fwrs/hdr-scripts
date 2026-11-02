#!/bin/bash -euo pipefail
side=$((92 * $1))
stem=${2##*/}
magick "$2" \
  -resize "${side}x${side}^" \
  -gravity center \
  -extent "${side}x${side}" \
  -define quantum:format=floating-point \
  -colorspace RGB \
  -auto-gamma \
  -evaluate Multiply 1.5 \
  -evaluate Pow 0.9 \
  -colorspace sRGB \
  -depth 16 \
  -profile 2020_profile.icc \
  +gravity \
  -crop 92x92 +repage \
  "${stem%.*}%02d.png"
