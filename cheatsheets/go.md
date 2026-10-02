# Golang

## Module info

Check modules to be updates

```shell
go list -u -m -json all
go list -u -m -f '{{.Path}} {{.Version}} {{ if .Update}}{{.Update.Version}}{{end}}' ./...
# or k8s.io/... for see only k8s updates
# or all
```

## Debug

Install `dlv` and compile the application without complier optimizations.

```shell
go build -gcflags='all=-N -l' -o app.go

dlv exec ./app -- param1 param2

(dlv) break runtime.gopanic
(dlv) continue
...
(dlv) stack         # display stacktrace
(dlv) frame 1       # set frame
(dlv) list          # display related source code
(dlv) print myVar   # print variable
(dlv) locals
(dlv) args
```
