# vim cheatsheet

## Copy and paste

Yank to register with `"ay` where `a` is the name of the register. Paste is
`"ap`. To check the registers do `:reg`. The `*` is the system clipboard
register.

## Complex movements

For yank, change or delete it comes handy.

| Shortcuts | Meaning              |
| --------- | -------------------- |
| a) or ab  | A pair of ()         |
| i) or ib  | Inside of ()         |
| a} or aB  | A pair of {}         |
| i} or iB  | Inside of {}         |
| a]        | A pair of []         |
| i]        | Inside of []         |
| a>        | A pair of <>         |
| i>        | Inside of <>         |
| a'        | A pair of ''         |
| i'        | Inside of ''         |
| a"        | A pair of ""         |
| i"        | Inside of ""         |
| a`        | A pair of ``         |
| i`        | Inside of ``         |
| at        | A pair of xmltag     |
| it        | Inside of xmltag     |
| iw        | Inside of word       |
| aw        | Word and a space     |
| is        | Inside of sentence   |
| as        | Sentence and a space |
| ip        | Inside of paragraph  |
| ap        | Paragr. and a space  |

## Edit binary files

Start vim with `-b` binary mode with the file and make a hex to text conversion
with `:%!xxd`. Edit the bytes then convert back with `:%!xxd -r`. Then save.
