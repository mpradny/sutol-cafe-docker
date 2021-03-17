#!/bin/bash

docker volume create demo4_notesdata

docker run --rm -it -d \
    -v demo4_notesdata:/local/notesdata \
    --name domino_volume_prep \
    alpine 

src_dir="source/notesdata"
dst_dir="/local"

tar --owner=1000 --group=0 --mode="770" -cf - -C $(dirname ${src_dir}) $(basename ${src_dir}) | docker exec -i domino_volume_prep tar -xf - -C ${dst_dir}

docker stop domino_volume_prep