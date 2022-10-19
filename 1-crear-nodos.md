# CREACION DE NODO 1 ------------------------------------------------------------------------
docker run -p 9042:9042 --name nodo1 -d cassandra:latest
# OBTENER <ip_nodo_1>
docker inspect --format='{{.NetworkSettings.IPAddress}}' nodo1

# CREACION DE NODO 2 ------------------------------------------------------------------------
docker run -p 9043:9043 --name nodo2 -e CASSANDRA_SEEDS=<ip_nodo_1> -d cassandra:latest
docker run -p 9043:9043 --name nodo2 -e CASSANDRA_SEEDS=172.17.0.2 -d cassandra:latest
# OBTENER <ip_nodo_2>
docker inspect --format='{{.NetworkSettings.IPAddress}}' nodo2

# CREACION DE NODO 3 ------------------------------------------------------------------------
docker run -p 9044:9044 --name nodo3 -e CASSANDRA_SEEDS="<ip_nodo_1>, <ip_nodo_2>" -d cassandra:latest
docker run -p 9044:9044 --name nodo3 -e CASSANDRA_SEEDS="172.17.0.2, 172.17.0.3" -d cassandra:latest
# OBTENER <ip_nodo_3>
docker inspect --format='{{.NetworkSettings.IPAddress}}' nodo3

# CREACIÓN DE KEYSPACE ------------------------------------------------------------------------
docker exec -t nodo1 bash
cqlsh
CREATE KEYSPACE tarea1 WITH replication={'class':'SimpleStrategy', 'replication_factor':'3'}; 
use tarea1;

# VERIFICAR ESTADO DE KEYSPACE ------------------------------------------------------------------------
docker exec -t nodo1 nodetool status tarea1
