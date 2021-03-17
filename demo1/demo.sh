#!/bin/bash

docker run -it \
    -h demo01.sutol.demo \
    -p 80:80 -p 1352:1352 \
    -v $(pwd)/config.json:/local/config.json \
    -e SetupAutoConfigure=1 -e SetupAutoConfigureParams=/local/config.json \
    --name demo01_sutol \
    domino-docker:V1200_02112021prod