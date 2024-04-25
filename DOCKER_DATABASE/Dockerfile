FROM postgres:latest

EXPOSE 5432

VOLUME /var/lib/postgresql/data

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=my_docker_ass_database

CMD ["postgres", "-c", "listen_addresses=*"]