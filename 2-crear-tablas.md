# CREACION DE TABLAS ------------------------------------------------------------------------

### entrar a contenedor de docker del nodo 1
docker exec -t nodo1 bash
cqlsh

## tabla consulta 1 (carrera-periodo)
### Llave de particion: carrera
### Orden en Clusters: periodo
CREATE TABLE postulaciones_carrera_periodo (
cedula text,
periodo int,
sexo text,
preferencia int,
carrera text,
estado text,
facultad text,
grupo_depen text,
region text,
pace text,
gratuidad text,
puntaje decimal,
latitud decimal,
longitud decimal,
ptje_nem decimal,
psu_promlm decimal,
PRIMARY KEY((carrera),periodo)
)
WITH CLUSTERING ORDER BY (periodo DESC);

## Tabla consulta 2 (carrera-region-periodo)
### Llave de particion: carrera, region
### Orden en Clusters: periodo
CREATE TABLE postulaciones_carrera_region (
cedula text,
periodo int,
sexo text,
preferencia int,
carrera text,
estado text,
facultad text,
grupo_depen text,
region text,
pace text,
gratuidad text,
puntaje decimal,
latitud decimal,
longitud decimal,
ptje_nem decimal,
psu_promlm decimal,
PRIMARY KEY((region, carrera),periodo)
)
WITH CLUSTERING ORDER BY (periodo DESC);

## Tabla Consulta 3:
### Llave de particion: facultad
### Orden en Clusters: psu_promlm
CREATE TABLE postulaciones_facultad_ptje (
cedula text,
periodo int,
sexo text,
preferencia int,
carrera text,
estado text,
facultad text,
grupo_depen text,
region text,
pace text,
gratuidad text,
puntaje decimal,
latitud decimal,
longitud decimal,
ptje_nem decimal,
psu_promlm decimal,
PRIMARY KEY((facultad),psu_promlm)
)
WITH CLUSTERING ORDER BY (psu_promlm DESC);
