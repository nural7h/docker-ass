echo "Stopping and removing existing docker_database container if it exists..."
docker stop $(docker ps -aq --filter name=docker_database)
docker rm $(docker ps -aq --filter name=docker_database)

echo "Removing existing docker_database image if it exists..."
docker rmi -f docker_database

echo "Running Dockerfile..."
docker build -t docker_database .
docker run -p 5432:5432 docker_database