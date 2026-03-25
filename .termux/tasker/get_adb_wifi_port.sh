./mdnssd -c 1 -t 5 _adb-tls-connect._tcp.local | grep adb | cut -f 2 | sort | uniq
