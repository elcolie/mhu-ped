## The complete example of how to recovery bak file
`bak` file in data is a database of MS SQL Server 2008
And I want to restore it to MS SQL Linux server 2017 docker

In order to restore it `bak` file does known the soure and destination already
I have to supply the new one for new environement

## Create docker-compose file
I have `bak` file in the `./data` directory mounted by host-volume


## Execute inside the container
1. `docker ps` and memorize the `container-id`
1. `docker exec -it container-id /bin/bash`. To login the container
1. `/opt/mssql-tools/bin/sqlcmd -S localhost -U SA`
Now you are in the sql shell

Find the logical name of database. This is a jigsaw you can not miss
```
1> RESTORE FILELISTONLY FROM DISK ='/trash/dbWINS_MPMBA201803141100.bak' WITH FILE=1
2> GO
```
You have to open in the text editor copy&paste the output from them.
I use normal terminal and lines are very long and mess up the columns.
In my case `LogicalName` are `dbERP_New_Data` and `dbERP_New_Log`

Therefore my execution lines will be
```
1> RESTORE DATABASE dbERP_New_Data
2> FROM DISK = '/trash/dbWINS_MPMBA201803141100.bak'
3> WITH MOVE 'dbERP_New_Data' TO '/root/dbERP_New_Data.mdf',
4> MOVE 'dbERP_New_Log' TO '/root/dbERP_New_Log.ldf'
5> GO
```
And you are done


## Cautions
DO NOT USE HOST-VOLUME TO HANDLE THE NEW BULKFILES OF RESTORED DATABASE
OTHERWISE IT WILL RAISES THE ERROR. USE CONTAINER DIRECTORY IS A MUST

## Thanks to:
Jeroen Mostert: https://stackoverflow.com/questions/49358950/ms-sql-server-linux-docker-asking-for-file-in-d/49360642#49360642

