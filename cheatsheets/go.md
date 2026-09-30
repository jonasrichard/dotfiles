# Golang

## Module info

Check modules to be updates

```shell
go list -u -m -json all
go list -u -m -f '{{.Path}} {{.Version}} {{ if .Update}}{{.Update.Version}}{{end}}' ./...
# or k8s.io/... for see only k8s updates
# or all
```
