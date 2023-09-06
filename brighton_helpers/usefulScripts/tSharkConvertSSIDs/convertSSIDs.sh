#!/bin/bash

#After exporting a BSSID: SSID tshark output, this script will convert the Hex string SSIDs into ASCII and still associate with correct BSSID
#Usage ./convertSSID <txt>

file=$1

while read -r line; do
  mac=$(echo "$line" | cut -d'	' -f1)   # extract MAC address
  value=$(echo "$line" | cut -d'	' -f2) # extract SSID value
  converted=$(echo "$value" | xxd -r -p) # convert SSID value using xxd
  echo "$mac $converted"
done < $file
