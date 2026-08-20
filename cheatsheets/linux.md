# Commands easy to forget

## Files

### Hex manipulation

Convert to text representation `xxd infile outfile` or back
`xxd -r infile outfile`.

Dump the file to the terminal to see it.

```
hexdump -C -s <offset> -n <len> <file>
```

Truncating file

```
truncate -s <size> | +5M | -1K <filename>
```
