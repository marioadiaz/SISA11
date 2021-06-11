#!/bin/bash

# variables

directorio="/media/mdiaz/DATA-01/MDIAZ/10-PROYECTOS/SISA11/Bd";

database="SISA11_development";

fecha="`date +%Y%m%d%H%M%S`";

usuario="postgres"

host="192.168.100.250"

export PGPASSWORD=root

# generar el dump y crear el log

pg_dump -U $usuario -h $host -F t -d $database|gzip -9 > $directorio/$fecha.sql && echo 'Respaldo realizado con exito:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log;
