sudo apt-get update && sudo apt-get install -y nginx

sudo ufw enable

sudo ufw allow 'Nginx Full'

sudo ufw allow ssh

sudo ufw status

sudo systemctl status nginx
