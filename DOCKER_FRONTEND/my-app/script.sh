echo "Stopping old container if exists..."
docker stop my_docker_ass_frontend_container
echo "Removing old container if exists..."
docker rm my_docker_ass_frontend_container

echo "Running Dockerfile..."
docker build -t docker_frontent .
docker run -p 3000:3000 --name my_docker_ass_frontend_container docker_frontent