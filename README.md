docker build . -t my-web -f multistage/Dockerfile
docker rmi  $(docker images -q)
docker rm -f $(docker ps -aq)
