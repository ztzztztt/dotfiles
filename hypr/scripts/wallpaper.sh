#!/bin/bash

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
	echo "Usage:
	$0 <dir containg images>"
	exit 1
fi

# images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

# the interval time of switching the next images
INTERVAL=1800

# while true;
# do
#     find "$1" \                                 # get images from dir
#         | while read -r img;                    # get filepath
#         do
#             echo "$((RANDOM % 1000)):$img"      # add random number to image file
#         done \
#         | sort -n | cut -d":" -f2- \            # sort & get image filepath
#         | while read -r img;                    # do loop to show
#         do
#             swww img "$img"
#             sleep $INTERVAL
#         done
# done


while true; do
    find "$1" \
        | while read -r img; do
            echo "$((RANDOM % 1000)):$img"
        done \
        | sort -n | cut -d":" -f2- \
        | while read -r img; do
            swww img "$img"
            sleep $INTERVAL
        done
done


