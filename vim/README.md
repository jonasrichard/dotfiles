### Text objects

 * `c` change
 * `d` delete
 * `y` yank
 * `v` visual select
 * `>` indent

 * `iw` inner word
 * `i"` inner string
 * `it` inner tag
 * `ip` inner paragraph
 * `as` sentence
 * `i}` `i)` `i]` inner content of brackets

 * `f/F` find next char, position on that
 * `t/T` find next char, position before that
 * `/` search (`c/continue<cr>break<esc>` repeatable)

### Moving

 * `ma`..`mz` set mark
 * `'a`..`'z` jump to marked line (with backtrick it moves the position)
 * `'.` jump to the last edited line

 * `"add` cut the line and store in the `a` register

 * `:r!cmd` executes the command and writes its output to the current buffer

 * `1,$j` join all lines from the 1st to the last

 * `:% g/#/p` grep all commented lines and print them
 * `:% g/^  /m$` all the lines starting with 2 spaces are moved to the end of the buffer
 * `:% g/select/-1j` all the lines containing select are joined to the previous line
 * `:.,$v/bar/d` from this line delete all lines which doesn't contain bar
