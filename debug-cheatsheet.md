## Go debug

First how to debug tests because they are a bit more tricky.

```
$ go test -c -gcflags='all=-N -l'
$ dlv exec project.test
(dlv) break source_file.go:52
(dlv) breakpoints
(dlv) n   -- next
(dlv) c   -- continue
(dlv) locals
(dlv) print variable
(dlv) l   -- list code context
```

## LLDB commands

[lldb commands](https://lldb.llvm.org/use/map.html)

|Command                     |Description                        |
|----------------------------|-----------------------------------|
|breakpoint - br             |                                   |
|br list                     |List breakpoints                   |
|br file:line                |Set breakpoint                     |
|br mod -c "x < 0" 1         |                                   |
|                            |                                   |
|watch set var global        |                                   |
|                            |                                   |
|                            |                                   |
|r                           |Run the application                |
|s                           |Single step                        |
|n                           |Step over                          |
|c                           |Continue execution                 |
|                            |                                   |
|fr v                        |frame variable                     |
|br                          |thread backtrace                   |
|thread list                 |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
|                            |                                   |
