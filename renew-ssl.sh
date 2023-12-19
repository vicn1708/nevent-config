echo "Copy ssl config to nginx..."
sudo cp -r ./nginx/conf-ssl/* ./nginx/conf

echo "Reload NGINX..."
sudo docker exec nginx nginx -s reload

echo "Renew ssl configuration"
sudo docker compose run --rm certbot renew