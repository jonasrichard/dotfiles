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

## Setup vim

Add plugin `elixir-editors/vim-elixir` and also an autocommand to detect Elixir filetype if it is needed.

Install `elixir-ls` language server in your tooling directory.

```bash
$ git clone git@github.com:elixir-lsp/elixir-ls.git
$ cd elixir-ls
$ mix deps.get
$ mix compile
$ MIX_ENV=prod mix elixir_ls.release
```

Add `elixir-ls` to ALE linters and `mix_format` to ALE fixers.
