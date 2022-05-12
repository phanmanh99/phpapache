FROM amd64/mysql:5.7
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf