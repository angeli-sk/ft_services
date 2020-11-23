# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: angeli <angeli@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/11 13:18:04 by angeli        #+#    #+#                  #
#    Updated: 2020/11/23 14:41:27 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

RUN apk update && \
	apk upgrade && \
	apk add nginx \
			mysql-client \
			php7 \
			php7-json \
			php7-fpm \
			php7-session \
			php7-mysqli \
			php7-mbstring \
			php7-phar \
			jq
RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	mkdir -p /var/run/nginx
COPY nginx.conf	/etc/nginx/nginx.conf
COPY setup.sh	/
RUN chmod +x /setup.sh
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
WORKDIR /www
RUN wp core download
WORKDIR /
EXPOSE 5050
CMD ./setup.sh

