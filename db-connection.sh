docker exec -it composed_docker_database /bin/sh
psql -U postgres
\l
\c my_docker_ass_database
\dt
set schema 'public';
select * from todo;