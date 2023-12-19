sudo docker cp ./nginx/conf-ssl nginx:/etc/nginx/conf.d

sudo docker exec nginx nginx -s reload

sudo docker compose run --rm certbot renew