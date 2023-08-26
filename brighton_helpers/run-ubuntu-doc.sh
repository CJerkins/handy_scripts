#!/bin/bash


docker start ubuntu_dev
docker exec -it ubuntu_dev /bin/bash


#docker start -v /Volumes/THAWSPACE/docker/bind/Volumes/ubuntu:/ priceless_tharp
#docker exec -it priceless_tharp /bin/bash
