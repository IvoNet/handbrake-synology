#!/bin/sh
###############################################################################
# Please change the following variables to suit your needs
###############################################################################

# Place where the m4v files should be saved to...
CONVERTED_FILE_LOCATION="/volume1/video/m4v/inbox"

###############################################################################
# DO NOT CHANGE CODE BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING
###############################################################################
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
mkv="$(basename $1)"
map="$(dirname $1)"
m4v="${mkv%.*}.m4v"
m4v="$(basename $m4v)"
docker run --rm \
           --cpuset-cpus="1-2" \
           --name handbrake \
           -v "$(pwd)/$map:/input:ro" \
           -v "${CONVERTED_FILE_LOCATION}:/output:rw" \
           supercoder/docker-handbrake-cli:latest \
           -i "/input/$mkv" \
           -o "/output/$m4v" \
           -e x264  -q 20.0 -r 30 --pfr  -a 1 -E faac -B 160 -6 dpl2 -R Auto \
           -D 0.0 --audio-copy-mask aac,ac3,dtshd,dts,mp3 --audio-fallback ffac3 \
           -f mp4 -X 1280 -Y 720 --loose-anamorphic --modulus 2 -m \
           --x264-preset medium --h264-profile high --h264-level 3.1
IFS=$SAVEIFS