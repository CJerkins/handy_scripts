#!/bin/bash  
for i in {1..45}  
do  
timestamp=$(date +"%Y-%m-%d-%T")  
# Run your command here  
libcamera-jpeg -o /home/christa/Desktop/pics/$timestamp.jpg #&  
  
# Wait for 1 second before running the command again  
sleep 1  
done