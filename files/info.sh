#!/bin/bash
 
PROCCOUNT=$(ps -Afl | wc -l)
PROCCOUNT=$(expr $PROCCOUNT - 5)
GROUPZ=$(groups)

PROCESSEUR=$(facter processor0)
PROC_COUNT=$(facter processorcount)
IP_ADDR=$(facter ipaddress_eth0)

echo -e "
\033[0;35m------------------------------------: \033[0;37mSystem Data\033[0;35m :------------------------------------
  \033[0;37mHostname \033[0;35m= \033[1;32m$(hostname -f)
\033[0;35m   \033[0;37mAddress \033[0;35m= \033[1;32m${IP_ADDR}
\033[0;35m    \033[0;37mKernel \033[0;35m= \033[1;32m$(uname -r)
\033[0;35m       \033[0;37mCPU \033[0;35m= \033[1;32m${PROC_COUNT} x $PROCESSEUR
\033[0;35m    \033[0;37mMemory \033[0;35m= \033[1;32m$(cat /proc/meminfo | grep MemTotal | awk {'print $2'}) kB
\033[0;35m------------------------------------: \033[0;37mUser Connected\033[0;35m :---------------------------------
\033[0;35m \033[1;32m$PROCCOUNT of $(w)
\033[0;35m------------------------------------: \033[0;37mDisks Spaces\033[0;35m :-----------------------------------
\033[1;32m$(df -h -x tmpfs -x rootfs -x udev | grep -v udev)
\033[0;35m---------------------------------------------------------------------------------------
\033[0;37m
"
