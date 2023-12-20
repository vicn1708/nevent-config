echo "\nSSL nevent.io.vn\n"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d nevent.io.vn -d www.nevent.io.vn

echo "\nSSL admin.nevent.io.vn\n"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d admin.nevent.io.vn -d www.admin.nevent.io.vn

echo "\nSSL server.nevent.io.vn\n"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "\nRUN services\n"
sudo docker compose up -d

echo "\nRenew SSL nevent.io.vn\n"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d nevent.io.vn -d www.nevent.io.vn

echo "\nRenew SSL admin.nevent.io.vn\n"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --force-renewal -d admin.nevent.io.vn -d www.admin.nevent.io.vn

echo "\nRenew SSL server.nevent.io.vn\n"
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email  --force-renewal -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "\nStop NGINX\n"
sudo docker compose stop webserver

echo "\nConfig openSSL\n"
sudo openssl dhparam -out ./nginx/dhparam/dhparam-2048.pem 2048

sudo cp -r ./nginx/conf-ssl/* ./nginx/conf

sudo docker compose up -d --force-recreate --no-deps webserver