#!/bin/bash

# variables
directorio="/media/mdiaz/DATA-01/MDIAZ/10-PROYECTOS/SISA11/bd";

database="SISA11_development";

fecha="`date +%Y%m%d%H%M%S`";

usuario="postgres"

host="localhost"

export PGPASSWORD=postgres

# generar el dump y crear el log

pg_dump -U $usuario -h $host -F t -d $database|gzip -9 > $directorio/backup$fecha && echo 'Respaldo realizado con exito hoy:' "`date +%Y%m%d%H%M%S`" >> $directorio/bitacora.log;

#psql -U postgres -W -h SISA11_development < SISA_DEV20210721194857.sql
