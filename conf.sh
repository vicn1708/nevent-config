bash ./jenkins/jenkins.sh

sudo docker compose up -d --exclude certbot

sudo docker compose up -d certbot