#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O cnip.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chn_ip.txt

{
echo "/ip firewall address-list"

for net in $(cat cnip.txt) ; do
  echo "add list=cnip address=$net comment=AS4809"
done

} > ../cnip.rsc

cd ..
rm -rf ./pbr
