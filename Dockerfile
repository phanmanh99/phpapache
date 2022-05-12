FROM php:8.0-apache
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip \
    libpng-dev
RUN docker-php-ext-install gd mysqli pdo pdo_mysql zip && docker-php-ext-enable mysqli pdo pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer
RUN apt-get update && apt-get upgrade -y


