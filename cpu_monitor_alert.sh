#!/bin/bash

threshold=25
to="suryanew987@gmail.com"
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
 echo "cpu utilization: $cpu_use"
if [ $cpu_use -gt $threshold ]
    then
        echo "cpu warning!!!" |sendmail $to
    else
        echo "cpu ok!!!"
fi

