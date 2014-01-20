#!/bin/bash

clear
echo
echo -e "\e[1;92mbench.sh started...\e[0m"
echo
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$( uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }' )
io=$( ( dd bs=1M count=256 if=/dev/zero of=test_$$ conv=fdatasync && rm -rf test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' )

echo
echo -e "\e[1;92mBasic Information:\e[0m"
echo
echo "CPU model : $cname"
echo "Number of cores : $cores"
echo "CPU frequency : $freq MHz"
echo "Total amount of ram : $tram MB"
echo "Total amount of swap : $swap MB"
echo "System uptime : $up"
echo

echo
echo -e "\e[1;92mInput/Output (I/O) Test:\e[0m"
echo
echo "I/O Speed: $io"
echo

echo
echo -e "\e[1;92mSpeed Test:\e[0m"
echo
read -p "Would you like to perform an extensive Speed Test? Recommended for Dedicated Servers. [y/n]: " sptest
if [[ $sptest == [yY] ]]; then
echo
echo "Running extensive speed tests..."
echo
atlnap=$( wget -O /dev/null http://www.netdepot.com/speedtest/100MB.BIN 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "AtlantaNAP, Georgia, Atlanta, USA (100MB): $atlnap "

atlanticfl=$( wget -O /dev/null http://www.atlantic.net/wp-content/uploads/speed-test/100MB_Test.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Atlantic.Net, Orlando, Florida, USA (100MB): $atlanticfl"

#cstx=$( wget -O /dev/null http://mercury.dal.corespace.com/100mb_testfile.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
#echo "CoreSpace, Dallas, Texas, USA (100MB): $cstx"

coloatatl=$( wget -O /dev/null http://speed.atl.coloat.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Colo@, Atlanta, Georgia, USA (100MB): $coloatatl"

coloatchi=$( wget -O /dev/null http://speed.chi.coloat.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Colo@, Chicago, Illinois, USA (100MB): $coloatchi"

coloatla=$( wget -O /dev/null http://speed.la.coloat.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Colo@, Los Angeles California, USA (100MB): $coloatla"

coloatphx=$( wget -O /dev/null http://speed.phx.coloat.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Colo@, Phoenix, Arizona, USA (100MB): $coloatphx"

choopa=$( wget -O /dev/null http://speedtest.choopa.net/100MBtest.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Choopa, Piscataway, New Jersey, USA (100MB) $choopa"

#data102co=$( wget -O /dev/null http://speed.data102.com/bigfile.txt 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
#echo "Data102, Colorado Springs, Colorado (1GB): $data102co"

dskc=$( wget -O /dev/null http://www.datashack.net/speedtest/100MB.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Datashack, Kansas City, Missouri, USA (100MB): $dskc"

dsix=$( wget -O /dev/null http://37.252.235.199/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "DATASIX, Vienna, Austria (100MB): $dsix"

#enzuchi=$( wget -O /dev/null http://199.193.252.200/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
#echo "Enzu, Chicago, Illinois, USA (100MB): $enzuchi"

#enzutx=$( wget -O /dev/null http://199.193.250.29/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
#echo "Enzu, Dallas, Texas, USA (100MB) : $enzutx"

#enzula=$( wget -O /dev/null http://199.48.68.9/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
#echo "Enzu, Los Angeles, California, USA (100MB): $enzula"

fhlv=$( wget -O /dev/null http://199.47.210.50/100mbtest.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Fiberhub, Los Vegas, Nevada, USA (100MB): $fhlv"

gorackfl=$( wget -O /dev/null http://lg.gorack.net/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "GoRack, Jacksonville, Florida, USA (100MB): $gorackfl"

hivelocity=$( wget -O /dev/null http://speedtest.hivelocity.net/100MB.file 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Hivelocity, Tampa, Florida, USA (100MB): $hivelocity "

incerotx=$( wget -O /dev/null http://mrtg.incero.com/test.tar 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Incero, Dallas, Texas, USA (100MB): $incerotx"

joedc=$( wget -O /dev/null http://joesdatacenter.com/wp-content/uploads/100MB.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Joe's Datacenter, Kansas City, Missouri, USA (100MB): $joedc "

lwnl=$( wget -O /dev/null http://mirror.nl.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "LeaseWeb, Haarlem, The Netherlands (100MB): $lwnl"

lwva=$( wget -O /dev/null http://mirror.us.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "LeaseWeb, Manassas, Virginia, USA (100MB): $lwva"

lwger=$( wget -O /dev/null http://mirror.de.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "LeaseWeb, Frankfurt, Germany (100MB): $lwger"

lnstx=$( wget -O /dev/null http://limestonenetworks.com/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Limestone Networks, Dallas, Texas, USA (100MB): $lnstx "

lsindia=$( wget -O /dev/null http://103.12.211.5/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Leapswitch, Pune, India (100MB): $lsindia "

mcomla=$( wget -O /dev/null www.multacom.com/moo 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "MultaCOM, Los Angeles, California, USA (10MB): $mcomla"

nforcenl=$( wget -O /dev/null http://mirror.nforce.com/pub/speedtests/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "NForce, Amsterdam, Netherlands (100MB): $nforcenl"

ovhfr=$( wget -O /dev/null http://proof.ovh.net/files/100Mb.dat 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "OVH, Roubaix, France (100MB): $ovhfr "

phxnapaz=$( wget -O /dev/null http://174.138.175.114/ss-phx-100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "PheonixNAP, Phoenix, Arizona, USA (100MB): $phxnapaz"

phxnapva=$( wget -O /dev/null http://198.24.160.242/ss-ash-100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "PheonixNAP, Ashburn, Virginia, USA (100MB): $phxnapva"

peer1tor=$( wget -O /dev/null http://speedtesttor.com/100_MB.BIN 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Peer1, Toronto, Canada (100MB): $peer1tor"

peer1la=$( wget -O /dev/null http://speedtestla.com/100_MB.BIN 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Peer1, Los Angeles, California, USA (100MB): $peer1la"

peer1uk=$( wget -O /dev/null http://speedtestuk.com/100_MB.BIN 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Peer1, Portsmouth, United Kingdom (100MB): $peer1uk"

plsw=$( wget -O /dev/null http://www.privatelayer.com/100MB_test.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "PrivateLayer, Zurich, Switzerland (100MB): $plsw"

qnetla=$( wget -O /dev/null http://repos.lax-noc.com/speedtests/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "QuadraNet, Los Angeles, California, USA (100MB): $qnetla "

qnettx=$( wget -O /dev/null http://www.dal01.quadranet.com/speedtests/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "QuadraNet, Dallas, Texas, USA (100MB): $qnettx "

qnetmia=$( wget -O /dev/null http://repos.mia.lax-noc.com/speedtests/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "QuadraNet, Miami, Florida, USA (100MB): $qnetmia "

redsuk=$( wget -O /dev/null http://149.3.140.170/100.log 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Redstation, Docklands, United Kingdom (100MB): $redsuk "

rsuk=$( wget -O /dev/null http://www.speedtest.rapidswitch.com/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Rapidswitch, Maidenhead, United Kingdom (100MB): $rsuk "

statminusla=$( wget -O /dev/null http://www.staminus.net/test.100mb.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Statminus, Los Angeles, Californaia, USA (100MB): $statminusla"

sldl=$( wget -O /dev/null http://speedtest.dal05.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, Dallas, Texas, USA (100MB): $sldl"

slwa=$( wget -O /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, Seattle, Washington, USA (100MB): $slwa"

sldc=$( wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, Washington, D.C, USA (100MB): $sldc"

slho=$( wget -O /dev/null http://speedtest.hou02.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, Houston, Texas, USA (100MB): $slho"

slsj=$( wget -O /dev/null http://speedtest.sjc01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, San Jose, California, USA (100MB): $slsj"

slsp=$( wget -O /dev/null http://speedtest.sng01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, Singapore, Singapore (100MB): $slsp"

slnl=$( wget -O /dev/null http://speedtest.ams01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Softlayer, Amsterdam, Netherlands (100MB): $slnl"

steadfastchi=$( wget -O /dev/null http://testfile.chi.steadfast.net 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Steadfast, Chicago, Illinois, USA (100MB): $steadfastchi"

steadfastnyc=$( wget -O /dev/null http://testfile.nyc.steadfast.net 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Steadfast, Manhattan, New York, USA (100MB): $steadfastnyc"

shuk=$( wget -O /dev/null http://www.serverhouse.co.uk/speedtest/speedtest/100.log 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "ServerHouse, Fareham, Hampshire, United Kingdom (100MB): $shuk"

shchi=$( wget -O /dev/null http://dft.singlehop.com/100megabytefile.tar.gz 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "SingleHop, Chicago, Illinois, USA (100MB): $shchi "

shphx=$( wget -O /dev/null http://dft.singlehop.com/100megabytefile.tar.gz 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "SingleHop, Phoenix, Arizona, USA (100MB): $shphx "

shams=$( wget -O /dev/null http://ams01.singlehop.com/100megabytefile.tar.gz 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "SingleHop, Amsterdam, Netherlands (100MB): $shams "

seflow=$( wget -O /dev/null http://seflow.it/infrastruttura/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "SeFlow, Milano, Italy (100MB): $seflow "

uks=$( wget -O /dev/null http://94.229.65.133/~cacticov/1000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "UKServers, Coventry, United Kingdom (100MB): $uks"

wimi=$( wget -O /dev/null http://www.wholesaleinternet.net/speedtest/100MB.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Wholesale Internet, Kansas City, Missouri, USA (100MB): $wimi"

wsnl=$( wget -O /dev/null http://93.190.137.8/1000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "WorldStream, Naaldwijk, Netherlands (100MB): $wsnl"

else #speed test else statement

echo
echo "Running basic speed test...";
echo

sixsyncnj=$( wget -O /dev/null http://6sync.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "6Sync, Weehawken, New Jersey, USA (100MB): $sixsyncnj"

anynodemi=$( wget -O /dev/null http://anynode.net/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "anyNode, Detroit, Michigan, USA (100MB): $anynodemi"

buyvmlv=$( wget -O /dev/null http://speedtest.lv.buyvm.net/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "BuyVM, Las Vegas, Nevada, USA (100MB): $buyvmlv"

buyvmny=$( wget -O /dev/null http://speedtest.ny.buyvm.net/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "BuyVM, New Jersey, New York, USA (100MB): $buyvmny"

crissicfl=$( wget -O /dev/null http://lg.crissic.net/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Crissic, Jacksonville, Florida, USA (100MB): $crissicfl"

dony=$( wget -O /dev/null http://speedtest-ny1.digitalocean.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "DigitalOcean, New York City, New York, USA (100MB): $dony"

dosf=$( wget -O /dev/null http://speedtest-sfo1.digitalocean.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "DigitalOcean, San Francisco, California, USA (100MB): $dosf"

donl=$( wget -O /dev/null http://speedtest-ams1.digitalocean.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "DigitalOcean, Amsterdam, Netherlands (100MB): $donl"

#gnetil=$( wget -O /dev/null http://www.gigenet.com/files/100MB.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
#echo "GigeNET, Arlington Heights, Illinois, USA (100MB): $gnetil"

wlmi=$( wget -O /dev/null http://www.liquidweb.com/data/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "LiquidWeb, Lansing, Michigan, USA (100MB): $lwmi"

lnjp=$( wget -O /dev/null http://speedtest.tokyo.linode.com/100MB-tokyo.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Linode, Tokyo, Japan (100MB): $lnjp"

lnuk=$( wget -O /dev/null http://speedtest.london.linode.com/100MB-london.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Linode, London, United Kingdom (100MB): $lnuk"

lnnj=$( wget -O /dev/null http://speedtest.newark.linode.com/100MB-newark.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Linode, Newark, New Jersey, USA (100MB): $lnnj"

lnatl=$( wget -O /dev/null http://speedtest.atlanta.linode.com/100MB-atlanta.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Linode, Atlanta, Georgia, USA (100MB): $lnatl"

lntx=$( wget -O /dev/null http://speedtest.dallas.linode.com/100MB-dallas.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Linode, Dallas, Texas, USA (100MB): $lntx"

lnca=$( wget -O /dev/null http://speedtest.fremont.linode.com/100MB-fremont.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Linode, Fremont, California, USA (100MB): $lnca"

prometeusit=$( wget -O /dev/null http://mirrors.prometeus.net/test/test100.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Prometeus, Milan, Italy (100MB): $prometeusit"

prometeustx=$( wget -O /dev/null http://lg-dallas.prometeus.net/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Prometeus, Dallas, Texas, USA (100MB): $prometeustx"

prometeusin=$( wget -O /dev/null http://lg-pune.prometeus.net/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "Prometeus, Pune, India (100MB): $prometeusin"

rnatl=$( wget -O /dev/null http://test.atl.ramnode.com/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "RamNode, Atlanta, Georgia, USA (100MB): $rnatl"

rnseawa=$( wget -O /dev/null http://test.sea.ramnode.com/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "RamNode, Seattle, Washington, USA (100MB): $rnseawa"

rnnl=$( wget -O /dev/null http://test.nl.ramnode.com/100MB.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "RamNode, Alblasserdam, Netherlands (100MB): $rnnl"

wtchi=$( wget -O /dev/null http://speedtest.wiredtree.com/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
echo "WiredTree, Chicago, Illinois, USA (100MB): $wtchi"


echo
fi #end speed test


echo
echo -e "\e[92mPing Test:\e[0m"
echo
pingcachefly=$(ping -c 5 -q cache.cachefly.net | awk -v FS="[, %]" '/packet loss/ {print 100-$9"% Packets Received! - "} $11 $12')
echo "Ping via cache.cachefly.net: " $pingcachefly
pinggoogle=$(ping -c 5 -q www.google.com | awk -v FS="[, %]" '/packet loss/ {print 100-$9"% Packets Received! - "} $11 $12')
echo "Ping via www.google.com: " $pinggoogle
echo

echo
echo -e "\e[92mTraceroute:\e[0m"
echo
trcachefly=$(traceroute -I cache.cachefly.net)
echo "$trcachefly"
echo
trgoogle=$(traceroute -I www.google.com)
echo "$trgoogle"
echo

echo
endtime=$( date -u )
echo -e "\e[92mbench.sh completed on $endtime\e[0m"

exit 0
#eof
