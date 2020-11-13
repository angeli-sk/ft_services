# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: angeli <angeli@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/11 13:18:04 by angeli        #+#    #+#                  #
#    Updated: 2020/11/12 16:24:36 by angeli        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.7

RUN apk update && \
	apk upgrade && \
    apk add mysql-client \
			php7 \
			php7-json \
			php7-fpm \
			php7-session \
			php7-mysqli \
			php7-mbstring \
			php7-phar \
			jq

COPY ./nginx.conf etc/nginx/nginx.conf
RUN mkdir /www/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

RUN cd /www && \
	wp core download --allow-root && \
	wp core config --allow-root --dbname=wordpress_db --dbuser=user --dbpass=$ecurepassword --dbhost=wordpress-mysql --dbprefix=wp_ && \
	echo "define( 'WP_DEBUG', true );" >> /www/wp-config.php && \
	echo "define( 'WP_DEBUG_LOG', true );" >> /www/wp-config.php && \
	wp core install --url=https://localhost/wordpress --title=dₒcₖₑᵣⓌⓗⓨ --admin_user=lemao --admin_password=$ecurepassword$ --admin_email=solange@kalea.nl --allow-root

EXPOSE 5050

CMD nginx

