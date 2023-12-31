echo "Install Docker..."
bash docker/install.sh

# echo "Install Jenkins..."
# bash jenkins/install.sh

echo "SSL nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d nevent.io.vn -d www.nevent.io.vn 

echo "SSL admin.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d admin.nevent.io.vn -d www.admin.nevent.io.vn

echo "SSL server.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "SSL bot.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d bot.nevent.io.vn -d www.bot.nevent.io.vn

# echo "SSL jenkins.nevent.io.vn"
# sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d jenkins.nevent.io.vn -d www.jenkins.nevent.io.vn

echo "RUN services"
sudo docker compose up -d
sudo docker compose ps
sudo docker compose logs certbot -f

sudo docker compose exec webserver ls -la /etc/letsencrypt/live

docker-compose up --force-recreate --no-deps certbot

sudo docker compose exec webserver ls -la /etc/letsencrypt/live

echo "Renew SSL nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d nevent.io.vn -d www.nevent.io.vn 

echo "Renew SSL admin.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d admin.nevent.io.vn -d www.admin.nevent.io.vn

echo "Renew SSL server.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "Renew SSL bot.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d bot.nevent.io.vn -d www.bot.nevent.io.vn

# echo "Renew SSL jenkins.nevent.io.vn"
# sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d jenkins.nevent.io.vn -d www.jenkins.nevent.io.vn

echo "Stop NGINX"
sudo docker compose down webserver

echo "Config openSSL"
sudo chmod -R 777 ./nginx/dhparam/
sudo openssl dhparam -out ./nginx/dhparam/dhparam-2048.pem 2048

sudo cp -r ./nginx/conf-ssl/* ./nginx/conf

sudo docker compose up -d --force-recreate --no-deps webserver
sudo docker compose ps