## Tracing

I need to write this because it is so easy to forget.

```erlang
dbg:start().
dbg:tracer().

dbg:p(all, c).

%% Trace all exported and local functions
dbg:tpl(module, []).

dbg:tpl(module, func, []).
dbg:tpl(module, func, arity, []).

%% Trace with return values
dbg:tpl(module, [{'_', [], [{return_trace}]}]).

dbg:stop_clear().

dbg:tracer(process, {fun (_,100) -> dbg:stop_clear();
                        (Msg, N) -> io:format("~p~n", [Msg]), N+1 end, 0
                    }).

%% To be reviewd
dbg:tracer(port,dbg:trace_port(file,{"/log/trace",wrap,atom_to_list(node()),50000000,12})).

dbg:p(all,[call,timestamp,return_to]).
```
