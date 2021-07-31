#!/bin/bash

# variables

directorio="/home/sisa/PROYECTOS/BACKUP";

exports="/home/sisa/PROYECTOS/BACKUP/EXPORTS";

database="SISA11_development";

fecha="`date +%Y%m%d%H%M%S`";

usuario="postgres"

host="192.168.1.250"

export PGPASSWORD=sisa09

# generar el dump y crear el log

#pg_dump -U $usuario -h $host -F c $database > $directorio/'SISA11'$fecha.tar && echo 'Respaldo TAR FORMAT realizado con exito:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log;
pg_dump -U $usuario -h $host -F p -d $database > $directorio/'SISA_DEV'$fecha.sql && echo 'Respaldo realizado con exito:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log;
#pg_dump -U $usuario -h $host -p 5432 -d $database  > $directorio/'SISA_DEV_'$fecha.sql && echo 'Respaldo test realizado con exito:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log;
pg_dump -i -h $host -U $usuario -t clientes -F p -b -v -f $directorio/'SISA11_'$fecha.sql && echo 'Respaldo realizado con exito:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log $database;
#funciona ok!
pg_dump -U $usuario -h $host -p 5432 --verbose --format=t --blobs -d $database  > $directorio/'SISA11_'$fecha.sql && echo 'Respaldo test realizado con exito:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log;

pg_dump -U $usuario $database > $exports/'SISA_EXPORTS'$fecha.pgsql

psql -U $usuario -d $database -t -A -F"," -c "select * from clientes" > $exports/'SISA_DEV_clientes'$fecha.csv
psql -U $usuario -d $database -t -A -F"," -c "select * from tecnicos" > $exports/'SISA_DEV_tecnicos'$fecha.csv
psql -U $usuario -d $database -t -A -F"," -c "select * from seguimientos" > $exports/'SISA_DEV_seguimientos'$fecha.csv
psql -U $usuario -d $database -t -A -F"," -c "select * from orden_fumigacions" > $exports/'SISA_DEV_ofumigacions'$fecha.csv
psql -U $usuario -d $database -t -A -F"," -c "select * from quejas" > $exports/'SISA_DEV_quejas'$fecha.csv

#restaurar! psql -U postgres -W -h localhost sisatest < /media/mdiaz/DATA-01/MDIAZ/01-Descargas/SISA_DEV20210716190335.sql

/usr/bin/pg_restore --host "localhost" --port "5432" --username "postgres" --no-password --role "mdiaz" --dbname "SISA11_development" --no-owner --verbose "/home/mdiaz/Descargas/SISA11_20210730164610.sql"
