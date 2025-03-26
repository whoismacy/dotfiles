#!/bin/bash

image_path="/home/shrmrm/Wallps/low.jpg"
convert "$image_path" -blur 0x5 blurred_image.png
i3lock -i blurred_image.png
rm blurred_image.png
