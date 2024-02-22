#!/bin/bash

# Separate keystore env and create operator

export NKEYS_PATH="`pwd`/keys"
nsc env --store "`pwd`/store"

nsc add operator --generate-signing-key --sys --name main_operator
nsc edit operator --require-signing-keys --account-jwt-server-url "nats://localhost:4222"

nsc env --operator main_operator

# Create accounts and users

nsc add account PUBLISHER
nsc edit account PUBLISHER --sk generate
nsc edit account PUBLISHER --js-disk-storage -1 --js-streams -1 --js-consumer -1

nsc add user --account PUBLISHER publisher

nsc add account CONSUMER
nsc edit account CONSUMER --sk generate
nsc edit account CONSUMER --js-disk-storage -1 --js-streams -1 --js-consumer -1

nsc add user --account CONSUMER consumer

nsc list keys -A

# Generate NATS resolver config which is included in the server configs

nsc generate config --nats-resolver --sys-account SYS > resolver.conf

# Generate account credentials

nsc generate creds --account SYS --output-file sys.creds
nsc generate creds --account PUBLISHER --output-file publisher.creds
nsc generate creds --account CONSUMER --output-file consumer.creds

# Create contexts

nats context save main_sys --nsc "nsc://main_operator/SYS/sys"
nats context save main_publisher --nsc "nsc://main_operator/PUBLISHER/publisher"
nats context save main_consumer --nsc "nsc://main_operator/CONSUMER/consumer" --server=nats://localhost:4226

# TODO Start cluster

# TODO then push to the server, for some reason it seeds the url explicitly

# nsc push -A
# nsc push -A --account-jwt-server-url=nats://localhost:4222

# TODO Replace leaf node remote accounts to the current ones

# TODO Start leaf cluster

# mean cluster                                 leaf cluster
# subject            stream                    subject                            stream
# temperature.UK  -> temperatures              main.publisher.temperature.UK  ->  leaf-temperatures

nats --context=main_publisher stream add --config main-stream.json --js-domain main

nsc add export --account PUBLISHER --name API-PUBLISHER --service --response-type Stream --subject '$JS.main.API.CONSUMER.>'
nsc add export --account PUBLISHER --name FC-PUBLISHER --service --response-type Stream --subject '$JS.FC.>'
nsc add export --account PUBLISHER --name Data-PUBLISHER --service --response-type Stream --subject 'temperature.>'

nsc add import --account CONSUMER --src-account PUBLISHER --name Remote-API-PUBLISHER --service --remote-subject '$JS.main.API.CONSUMER.>' --local-subject 'JS.publisher@main.API.CONSUMER.>'
nsc add import --account CONSUMER --src-account PUBLISHER --name Remote-FC-PUBLISHER --service --remote-subject '$JS.FC.>'
nsc add import --account CONSUMER --src-account PUBLISHER --name Remote-Data-PUBLISHER --remote-subject 'temperature.>' --local-subject 'main.publisher.temperature.>'

nats --context=main_consumer stream add --config leaf-stream.json --js-domain leaf
