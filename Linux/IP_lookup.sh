#!/bin/bash

#Determine country by ip address

curl -s http://ipinfo.io/$1 | grep country | awk -F: '{print $2}'
