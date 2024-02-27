## Leaf with nsc

nsc accounts are only supported on the hub cluster, leaf nodes connect back
to hub using credentials exported from the central account store.

### Setup accounts

```
export NKEYS_PATH="`pwd`/hub/keys"
nsc env --store "`pwd`/hub/store"
nsc add operator hub_operator
nsc env --operator hub_operator

nsc add account SYS
nsc edit operator --system-account SYS

nsc add account PUBLISHER
nsc edit account PUBLISHER --js-disk-storage -1 --js-mem-storage -1

nsc add account CONSUMER

nsc add user --account PUBLISHER publisher
nsc generate creds --account PUBLISHER --name publisher --output-file hub-publisher.creds

nsc generate config --nats-resolver --sys-account SYS --config-file hub-accounts.conf
```

Start hub server in hub directory

```
. ./hub.env
nsc push -A --account-jwt-server-url nats://localhost:4222
```

### Streams

```
nats --creds hub/hub-publisher.creds stream add mystream --subjects='mysubject.>' --js-domain hub

nats --server nats://localhost:4224 stream report --js-domain hub

nats --server nats://localhost:4224 stream add mymirror --mirror mystream --js-domain leaf
? Foreign JetStream domain name hub
? Delivery prefix from_publisher
```
