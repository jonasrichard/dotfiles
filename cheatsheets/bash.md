# bash magic

## Process substitution

`<(uname)` results in a file descriptor like `/dev/fd/63` which is a fifo
and serves as an input to read from.

```shell
while read -r line; do
    echo "$line"
done < <(grep pattern from /usr/a/big/file)
```
