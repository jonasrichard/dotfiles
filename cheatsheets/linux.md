# Commands easy to forget

TODO `lsof`

## Files

### Log matching

Matching out log parameters separated by spaces. Collecting all the fields by
field_id and unique sort them.

```shell
gawk 'match($0, /.*field_id=(\S+).*/, arr){ print arr[1] }' app.log | sort -u
```

### Hex manipulation

Convert to text representation `xxd infile outfile` or back
`xxd -r infile outfile`.

Dump the file to the terminal to see it.

```shell
hexdump -C -s <offset> -n <len> <file>
```

Truncating file

```shell
truncate -s <size> | +5M | -1K <filename>
```
