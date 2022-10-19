
# Consulta 1 (carrera-periodo)
SELECT * FROM postulaciones_carrera_periodo WHERE carrera='MEDICINA' and estado='SI';

# Consulta 2 (carrera-region-periodo)
SELECT * FROM postulaciones_carrera_region WHERE carrera='INGENIERIA CIVIL INFORMATICA' AND region='MAULE' and estado='SI';

# Consulta 3 (facultad-puntaje_psu)
SELECT * FROM postulaciones_facultad_ptje WHERE facultad='CIENCIAS DE LA SALUD' and estado='SI';

