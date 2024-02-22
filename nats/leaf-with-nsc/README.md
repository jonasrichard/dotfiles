## Stream mirroring on leaf nodes

```
brew tap nats-io/nats-tools
brew install nats-io/nats-tools/nats
brew install nats-io/nats-tools/nsc
```

### Separate keystore

```
export NKEYS_PATH="`pwd`/keys"
nsc env --store "`pwd`/store"

nsc add operator --generate-signing-key --sys --name main_operator
nsc edit operator --require-signing-keys --account-jwt-server-url "nats://localhost:4222"

nsc env --operator main_operator
```

### Setup accounts

```
nsc add account PUBLISHER
nsc edit account PUBLISHER --sk generate
nsc edit account PUBLISHER --js-disk-storage -1 --js-streams -1 --js-consumer -1

nsc add user --account PUBLISHER publisher

nsc add account CONSUMER
nsc edit account CONSUMER --sk generate
nsc edit account CONSUMER --js-disk-storage -1 --js-streams -1 --js-consumer -1

nsc add user --account CONSUMER consumer

nsc list keys -A

nsc generate config --nats-resolver --sys-account SYS > resolver.conf
nsc generate creds --name sys > sys.creds
nsc generate creds --name publisher > publisher.creds
nsc generate creds --name consumer > consumer.creds
```

