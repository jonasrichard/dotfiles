## MTU measurement

In Mac there is no tracepath, `ping` sends packets with increasing length with don't fragment bit set.

```bash
ping -D -g 1200 -G 1500 -h 32 <hostg>
```
