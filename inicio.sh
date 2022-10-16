# CREACION DE NODO 1 ------------------------------------------------------------------------
docker-run -p 9042:9042 --name nodo1 -d cassandra:latest
docker inspect --format='{{.NetworkSettings.IpAddress}}' nodo1

# CREACION DE NODO 2 ------------------------------------------------------------------------
docker-run -p 9043:9043 --name nodo2 -e CASSANDRA_SEEDS=<ip1> -d cassandra:latest
docker inspect --format='{{.NetworkSettings.IpAddress}}' nodo2

# CREACION DE NODO 3 ------------------------------------------------------------------------
docker-run -p 9044:9044 --name nodo3 -e CASSANDRA_SEEDS="<ip1>, <ip2>" -d cassandra:latest
docker inspect --format='{{.NetworkSettings.IpAddress}}' nodo3

# CREACIÓN DE KEYSPACE ------------------------------------------------------------------------
docker exec -t nodo1 bash
cqlsh
# almacenamiento en 1 solo datacenter
CREATE KEYSPACE tarea1 WITH replication={'class':'SimpleStrategy', 'replication_factor':'3'}; 
#almacenamiento en multiples datacenters
#CREATE KEYSPACE tarea1 WITH replication={'class':'NetworkTopologyStrategy', 'replication_factor':'3'};
use tarea1

# VERIFICAR ESTADO DE KEYSPACE ------------------------------------------------------------------------
docker exec -t nodo1 nodetool status tarea1

# CREACION DE TABLAS ------------------------------------------------------------------------