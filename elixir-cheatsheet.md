## Remote shell tricks

Start system without shell.

```
mix run --no-halt
# or
elixir -S mix run --no-halt
```

Detached mode, no console output

```
elixir --detached --sname name -S mix run --no-halt
```

Attach

```
iex --sname debugger@localhost --remsh remote@localhost --hidden

> System.stop()

elixir --sname terminator@localhost stop_node.exs
```

Start release in prod mode

```
MIX_ENV=prod elixir -S mix run --no-halt
```
