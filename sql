1. Login with `/opt/mssql-tools/bin/sqlcmd -S localhost -U SA`
1. Execute the follows
```
RESTORE DATABASE dbERP_New_Data
FROM DISK = '/trash/dbWINS_MPMBA201803141100.bak'
WITH MOVE 'dbERP_New_Data' TO '/trash/dbERP_New_Data.mdf',
MOVE 'dbERP_New_Log' TO '/trash/dbERP_New_Log.ldf'
GO
```

Experiment
```
RESTORE DATABASE dbERP_New_Data
FROM DISK = '/trash/dbWINS_MPMBA201803141100.bak'
WITH MOVE 'dbERP_New_Data' TO '/root/dbERP_New_Data.mdf',
MOVE 'dbERP_New_Log' TO '/root/dbERP_New_Log.ldf'
GO
```

If the shit happen
```
DROP DATABASE dbERP_New_Data
GO
```

Find junk tables.
```
SELECT 'Table Name'=convert(char(25),t.TABLE_NAME),
      'Total Record Count'=max(i.rows)
FROM sysindexes i, INFORMATION_SCHEMA.TABLES t
WHERE t.TABLE_NAME = object_name(i.id)
      and t.TABLE_TYPE = 'BASE TABLE'
GROUP BY t.TABLE_SCHEMA, t.TABLE_NAME
HAVING max(i.rows)<=0
```
Ref https://stackoverflow.com/questions/17748417/sql-server-management-studio-finding-all-non-empty-tables


