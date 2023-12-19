sudo cp -r nginx/nevent.io.vn.conf /etc/nginx/sites-available/nevent.io.vn
sudo cp -r nginx/server.nevent.io.vn.conf /etc/nginx/sites-available/server.nevent.io.vn
sudo cp -r nginx/admin.nevent.io.vn.conf /etc/nginx/sites-available/admin.nevent.io.vn
sudo cp -r nginx/jenkins.nevent.io.vn.conf /etc/nginx/sites-available/jenkins.nevent.io.vn

sudo ln -s /etc/nginx/sites-available/nevent.io.vn /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/server.nevent.io.vn /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/admin.nevent.io.vn /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/jenkins.nevent.io.vn /etc/nginx/sites-enabled/

sudo sed -i 's/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 64/' /etc/nginx/nginx.conf

sudo nginx -t

sudo systemctl restart nginx

sudo apt update
sudo apt install snapd

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx
 
sudo certbot certonly --non-interactive --nginx --email vicn1708@gmail.com -d nevent.io.vn -d www.nevent.io.vn.com -d admin.nevent.io.vn -d www.admin.nevent.io.vn.com -d server.nevent.io.vn -d www.server.nevent.io.vn.com -d jenkins.nevent.io.vn -d www.jenkins.nevent.io.vn.com

sudo certbot renew --dry-run

sudo systemctl restart nginx
