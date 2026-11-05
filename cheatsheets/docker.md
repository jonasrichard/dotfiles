# Docker help

## Share host resources

Sharing host ssh agent to docker container.

```shell
docker run -it \
  -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
  -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
  ubuntu bash
```

Use Colima docker environment.

```shell
export DOCKER_HOST=unix:///Users/jonasr/.colima/default/docker.sock
# docker commands
```

## Kind

To pull and image to a kind cluster you need to get the name of the cluster
node and exec the `crictl` command if you have `containerd` like in case of
Colima.

```shell
kind get nodes --name <your-cluster>
docker exec -it your-cluster-control-plane crictl pull <docker-image>
```

Connect to docker VM

```shell
docker run -it --privileged --pid=host justincormack/nsenter1
```

## Dive

Sometimes you cannot install dive (like inside Colima shell), so you need to
have a dockered dive.

```shell
colima ssh
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker.io/wagoodman/dive:latest <your-image>
```

## Cleanup

```shell
docker system prune
# can be container, image, volume, network, builder
```
