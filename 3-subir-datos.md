
# SUBIR DATOS

## copiar archivo postulaciones.cdv dentro del contenedor de docker
docker cp ./data/postulaciones.csv nodo1:/postulaciones.csv

## copiar archivos de cdv a cassandra
### entrar a contenedor de docker del nodo 1
docker exec -t nodo1 bash
cqlsh
use tarea1;

### Subir datos tabla 1:
COPY postulaciones_carrera_periodo(cedula, periodo, sexo, preferencia, carrera, estado, facultad, puntaje, grupo_depen, region, latitud, longitud, ptje_nem, psu_promlm, pace, gratuidad) FROM 'postulaciones.csv' WITH DELIMITER=';' AND HEADER=TRUE;

### Subir datos tabla 2:
COPY postulaciones_carrera_region(cedula, periodo, sexo, preferencia, carrera, estado, facultad, puntaje, grupo_depen, region, latitud, longitud, ptje_nem, psu_promlm, pace, gratuidad) FROM 'postulaciones.csv' WITH DELIMITER=';' AND HEADER=TRUE;

### Subir datos tabla 3:
COPY postulaciones_facultad_ptje(cedula, periodo, sexo, preferencia, carrera, estado, facultad, puntaje, grupo_depen, region, latitud, longitud, ptje_nem, psu_promlm, pace, gratuidad) FROM 'postulaciones.csv' WITH DELIMITER=';' AND HEADER=TRUE;
