# ssh and keys

## Setup key

First generate a key with the correct encryption. Since we start agent from the .zshrc it is better
if key doesn't have a keypass which is not that much recommended.

```shell
ssh-keygen -t rsa -b 4096 -C "your.email@address" -f id_keyfile
ssh-keygen -t ed25519 -C "your.email@address" -f id_keyfile
```

Set up `.ssh/config`, you may need `ssh.dev.azure.com` host, too., you may need `ssh.dev.azure.com` host, too., you may need `ssh.dev.azure.com` host, too.

```
Host azure.com
    HostName dev.azure.com
    IdentityFile ~/.ssh/id_rsa
```

Start agent on shell startup

```shell
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Test git access

```shell
ssh -vT git@ssh.dev.azure.com
git -c core.sshCommand="ssh -i ~/.ssh/id_rsa -vT" clone git@ssh.dev.azure.com:v3/<project>/<repo>
```
