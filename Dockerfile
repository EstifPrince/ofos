FROM geerlingguy/php-apache

ENV MYSQL_DB_USERNAME=root \
    MYSQL_DB_PASSWORD=password


RUN rm /var/www/html/index.html
COPY . /var/www/html