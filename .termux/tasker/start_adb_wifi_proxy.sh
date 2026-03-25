termux-wake-lock
port=$(./mdnssd -c 1 -t 5 _adb-tls-connect._tcp.local | grep adb | cut -f 2 | sort | uniq)
adb connect localhost:$port
adb tcpip 5555
adb disconnect
adb kill-server
termux-wake-unlock
