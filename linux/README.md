## MTU measurement

In Mac there is no tracepath, `ping` sends packets with increasing length with don't fragment bit set.

```bash
ping -D -g 1200 -G 1500 -h 32 <hostg>
```

```bash
nping --tcp -p 8080 <hostip> --df
```

```bash
# Increase tcp receive buffer sizes min/default/max
sysctl -w net.ipv4.tcp_rmem='524288 2097152 8388608'
#
netstat -i
# eth0 Ethernet statistics
ethtool -S eth0
# check and increase RX queue
ethtool -g eth0
ethtool -G eth0 rx 1024
```

## tcp capture

Look around

```bash
tcpdump -nS
tcpdump -nS 'tcp port http'
```

This is useful, captures the syn and fin packets, so whenever a tcp stream starts and ends.
The localnet filter doesn't work, I need to check it, but without that it is very useful.

```bash
tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0 and not src and dst net 10.3.60/24'
```

Show all URG, ACK, PSH, RST, SYN, FIN packets

```
Show all URG packets:
# tcpdump 'tcp[13] & 32 != 0'

Show all ACK packets:
# tcpdump 'tcp[13] & 16 != 0'

Show all PSH packets:
# tcpdump 'tcp[13] & 8 != 0'

Show all RST packets:
# tcpdump 'tcp[13] & 4 != 0'

Show all SYN packets:
# tcpdump 'tcp[13] & 2 != 0'

Show all FIN packets:
# tcpdump 'tcp[13] & 1 != 0'

Show all SYN-ACK packets:
# tcpdump 'tcp[13] = 18'
```

### Network send and receive guide

[sending data](https://blog.packagecloud.io/eng/2017/02/06/monitoring-tuning-linux-networking-stack-sending-data/)
[receiving data](https://blog.packagecloud.io/eng/2016/06/22/monitoring-tuning-linux-networking-stack-receiving-data/)

## Shell

gzip with keeping the original file

```
gzip -c inputfile > output.gz
```
