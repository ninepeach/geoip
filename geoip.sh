#!/usr/bin/env bash

mkdir -p ./tmp ./data
curl --output tmp/delegated-apnic-latest http://ftp.apnic.net/stats/apnic/delegated-apnic-latest

cat ./tmp/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > ./data/cn_ip_list

cat ./tmp/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv6/ {print $4 "/" 32-log($5)/log(2)}' | cat >> ./data/cn_ip_list

cat ./tmp/delegated-apnic-latest | awk -F '|' '/HK/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' | cat > ./data/hk_ip_list

cat ./tmp/delegated-apnic-latest | awk -F '|' '/HK/&&/ipv6/ {print $4 "/" 32-log($5)/log(2)}' | cat >> ./data/hk_ip_list
