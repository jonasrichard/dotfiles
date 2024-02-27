## Install nats tools

```
brew tap nats-io/nats-tools
brew install nats-io/nats-tools/nats
brew install nats-io/nats-tools/nsc
```

## Separete key store

```
export NKEYS_PATH="`pwd`/keys"
nsc env --store "`pwd`/store"
nsc env --operator OP
```

## References

 * [Jetstream on leaf nodes](https://github.com/nats-io/jetstream-leaf-nodes-demo/)
