sudo docker compose down
sudo docker stop $(docker ps -aq)
sudo docker rm $(docker ps -aq)
sudo docker image prune -a
sudo docker volume prune -f
sudo docker network prune -f