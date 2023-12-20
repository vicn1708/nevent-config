echo "Install Docker..."
bash docker/install.sh

# echo "SSL nevent.io.vn"
# sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --email vicn1708@gmail.com --agree-tos --no-eff-email --staging -d nevent.io.vn -d www.nevent.io.vn -d admin.nevent.io.vn -d www.admin.nevent.io.vn -d server.nevent.io.vn -d www.server.nevent.io.vn

echo "RUN services"
sudo docker compose up -d
sudo docker compose ps
