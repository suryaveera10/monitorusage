#!/bin/bash

threshold=25
to="suryanew987@gmail.com"
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`


cpu_usage(){
if [ $cpu_use -gt $threshold ]
    then
        echo "cpu warning!!!" |sendmail $to
    else
        echo "cpu ok!!!"
fi
}


mem_usage(){
if [ $mem_free -lt $threshold  ]
    then
        echo "memory warning!!!" |sendmail $to
    else
        echo "mem ok!!!"
fi
}


disk_usage(){
 for path in `df -h|grep -vE '(Filesystem|tmpfs)' | awk '{print $5}' | cut -f 1 -d "%"`
 
 do
 
if [ $path -gt $threshold ]
    then
         echo "Subject:disk warning!!!" | sendmail $to
    else
        echo "disk ok!!!"
fi

done
}

cpu_usage
mem_usage
disk_usage
