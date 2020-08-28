## MTU measurement

In Mac there is no tracepath, `ping` sends packets with increasing length with don't fragment bit set.

```bash
ping -D -g 1200 -G 1500 -h 32 <hostg>
```

```bash
nping --tcp -p 8080 <hostip> --df
```

```bash
sysctl -w net.ipv4.tcp_rmem='524288 2097152 8388608'
netstat -i
ethtool -S eth0
# check and increase RX queue
ethtool -g eth0
ethtool -G eth0 rx 1024
```
