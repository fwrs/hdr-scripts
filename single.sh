#!/bin/bash -euo pipefail
magick input.png \
  -define quantum:format=floating-point \
  -colorspace RGB \
  -auto-gamma \
  -evaluate Multiply 1.5 \
  -evaluate Pow 0.9 \
  -colorspace sRGB \
  -depth 16 \
  -profile 2020_profile.icc \
  output.png
