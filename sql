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