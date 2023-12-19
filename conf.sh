echo "Set up jenkins..."
bash ./jenkins/jenkins.sh

echo "Set up services..."
sudo docker compose up -d certbot