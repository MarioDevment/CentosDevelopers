# Centos for Web developers

This is an amazing local web server for developers

## Requirements

- Virtualbox 5.2+ and comamand line
- Vagrant 2.1.1 

## What includes?:

Web:

- Apache 2
- MySQL
- MongoDB
- PHP 7.1 - 7.2
- NTP config for Madrid (you can changed)
- Composer
- NodeJS
- GIT
- Yarn
- php-zip (for composer)
- Blackfire

Performance:

- Redis
- RabbitMQ
- ElasticSearch
- Logstash
- Kibana

now you need only run: **vagrant up**

## Virtualhosts

This machine configure whit multiple virtualhost, is perfect for symfony install, laravel and other frameworks.

All virtualhost you can access from ip (192.168.50.xx) and the public folder on sites directory.

If you need add more virtual host, you can add new ip on **Vagrantfile** and add new virtualhost on **/ansible/templates/vhost.conf.base**

### Example

VagrantFile

      webserver.vm.network "private_network", ip: "192.168.50.10" #All html
      webserver.vm.network "private_network", ip: "192.168.50.20" #Symfony Example
      webserver.vm.network "private_network", ip: "192.168.50.30" #Laravel Example

Template: vhost.conf.base

      <VirtualHost 192.168.50.20:80>
          DocumentRoot "/var/www/symfony/public"
          ServerName symfony.dev
          ServerAlias www.symfony.dev
          ErrorLog "/var/log/httpd/symfony.error"
          CustomLog "/var/log/httpd/symfony.access" combined
          <Directory "/var/www/symfony/public">
              DirectoryIndex index.html index.php
              Options FollowSymLinks
              AllowOverride All
              Require all granted
              Options -Indexes
              RewriteEngine On
              RewriteCond %{REQUEST_FILENAME} !-f
              RewriteCond %{REQUEST_FILENAME} !-d
              RewriteRule ^(.*)$ index.php/$1 [L]
          </Directory>
      </VirtualHost>


you can add all the ip and virtualhost you want for your projects

## This incluye demo install

- Symfony 4.1 clear skeleton install on ip 192.168.50.20
- Laravel 2.1 clear install on ip: 192.168.50.30

only need run **composer install**

__The rest of pure and dirty html is in the html folder of the ip 192.68.50.10__

## Information general

- For init all machines: vagrant up
- For external ssh: private_key /CentosDevelospers/vagrant/.vagrant/machines/web/virtualbox/private_key

