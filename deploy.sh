sudo docker compose pull nevent-client
sudo docker compose pull nevent-admin
sudo docker compose pull nevent-server

sudo docker compose up -d nevent-client
sudo docker compose up -d nevent-admin
sudo docker compose up -d nevent-server

sudo docker image prune -f
