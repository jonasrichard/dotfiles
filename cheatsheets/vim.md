# vim cheatsheet

## Copy and paste

Yank to register with `"ay` where `a` is the name of the register. Paste is
`"ap`. To check the registers do `:reg`. The `*` is the system clipboard
register.

## Edit binary files

Start vim with `-b` binary mode with the file and make a hex to text conversion
with `:%!xxd`. Edit the bytes then convert back with `:%!xxd -r`. Then save.
