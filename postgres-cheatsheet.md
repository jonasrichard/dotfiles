## Postgres

Get table row counts in a groupped format.

```sql
select relname, relpages, to_char(reltuples::bigint, '999G999G999G999'), pg_size_pretty(pg_total_relation_size('public.' || relname)) from pg_class where relname in (<tables>);
```
