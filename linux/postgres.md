## Postgresql

Size of the tables

```sql
select relname, relkind, pg_size_pretty(pg_relation_size('foo')) from pg_class
```
