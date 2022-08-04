#!/bin/bash

filename=`mktemp`

# Create a screenshot
grim - | convert -filter Gaussian -resize 20% -blur 0x2.5 -resize 100% - $filename
swaylock -e -f -i $filename
 
