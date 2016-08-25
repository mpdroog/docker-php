SimpleSite
=================
Docker container with PHP7/Nginx.

Content of container:
* PHP-FPM7
* Nginx
* s6-overlay
* Alpine Linux
* https://github.com/mpdroog/core
 
docker-compose.ynl
=================
Spawn-off a development environment with
a single instance Percona XtraDB Cluster instance for MySQL.

Why Percona XtraDB?
* Performance by default no tweaking necessary;
* XtraDB Cluster uses Galera for replication (active/active);
* XtraDB Cluster has an official Docker container from Percona
 with some blogs about scaling without messing with IPs;
* Percona is in Amsterdam once a year, so possibility
 to discuss issues with the software easilly;
