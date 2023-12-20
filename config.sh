echo "Install Docker..."
bash docker/install.sh

echo "SSL nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d nevent.io.vn -d www.nevent.io.vn

echo "SSL admin.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d admin.nevent.io.vn -d www.admin.nevent.io.vn

echo "SSL server.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "RUN services"
sudo docker compose up -d

echo "Renew SSL nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d nevent.io.vn -d www.nevent.io.vn

echo "Renew SSL admin.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d admin.nevent.io.vn -d www.admin.nevent.io.vn

echo "Renew SSL server.nevent.io.vn"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email  --force-renewal -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "Stop NGINX"
sudo docker compose stop webserver

echo "Config openSSL"
sudo openssl dhparam -out ./nginx/dhparam/dhparam-2048.pem 2048

sudo cp -r ./nginx/conf-ssl/* ./nginx/conf

sudo docker compose up -d --force-recreate --no-deps webserver