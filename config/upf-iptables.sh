#!/bin/bash
#
# Configure iptables in UPF
#

ip address show dev eth0 | grep 10.100.201.3

dnnIfc=""

retVal=$?
if [ $retVal -eq 0 ]; then
    echo "eth0 is dnn"
    dnnIfc="eth0"
else
    echo "eth1 is dnn"
    dnnIfc="eth1"
fi

iptables -t nat -A POSTROUTING -s 10.60.0.0/24 -o "$dnnIfc"  -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.61.0.0/24 -o "$dnnIfc"  -j MASQUERADE


