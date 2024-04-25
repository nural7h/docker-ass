echo "Stopping old container if exists..."
docker stop my_docker_ass_backend_container
echo "Removing old container if exists..."
docker rm my_docker_ass_backend_container

echo "Running Dockerfile..."
docker build -t docker_backend .
docker run -p 8080:8080 --name my_docker_ass_backend_container docker_backend