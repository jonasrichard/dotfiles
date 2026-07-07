# Docker

## Use dive

Sometimes you cannot install dive (like inside Colima shell), so you need to
have a dockered dive.

```shell
colima ssh
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker.io/wagoodman/dive:latest <your-image>
```
