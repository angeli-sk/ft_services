# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/09 15:59:28 by akramp        #+#    #+#                  #
#    Updated: 2020/11/28 16:02:19 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

# RUN apk add phpmyadmin nginx --no-cache


RUN apk update && \
    apk add nginx && \
    apk add lighttpd php7-json \
	php7 php7-fpm \
	php7-session php7-mysqli \
	php7-mbstring mysql --no-cache

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	mkdir -p /var/run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.2-english.tar.gz
RUN mv phpMyAdmin-5.0.2-english /www/phpmyadmin
RUN mkdir /www/phpmyadmin/tmp
RUN chown -R www:www /www/phpmyadmin/tmp

# RUN adduser -D user
# RUN echo "user:user" | chpasswd

# RUN /usr/bin/mysqld --user=mysql --init_file=/www/phpmyadmin/sql/create_tables.sql

COPY config.inc.php /www/phpmyadmin/config.inc.php
COPY nginx.conf	/etc/nginx/nginx.conf

EXPOSE 5000

CMD php-fpm7 && php -S 0.0.0.0:5000 -t /www/phpmyadmin
