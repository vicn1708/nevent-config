sudo cp -r ./nginx/conf-ssl ./nginx/conf

sudo docker exec nginx nginx -s reload

sudo docker compose run --rm certbot renew