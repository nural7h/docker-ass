echo "Stopping old container if exists..."
docker stop my_docker_ass_database_container
echo "Removing old container if exists..."
docker rm my_docker_ass_database_container

echo "Running Dockerfile..."
docker build -t docker_database .
docker run -p 5455:5432 --name my_docker_ass_database_container docker_database