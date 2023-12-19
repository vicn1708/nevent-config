sudo apt-get update && sudo apt-get install -y nginx

sudo ufw enable

sudo ufw allow 'Nginx Full'

sudo systemctl status nginx
