# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/09 15:59:28 by akramp        #+#    #+#                  #
#    Updated: 2020/11/14 13:51:35 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

RUN apk update && \
	apk upgrade && \
	apk add php-fpm \
	php-mysql \
	php7.3 \
	php7.3-fpm \
	php7.3-mysql \
	php-common \
	php7.3-cli \
	php7.3-common \
	php7.3-json \
	php7.3-opcache \
	php7.3-readline \
	php7.3-mbstring \
	nginx

EXPOSE 5000

RUN mkdir -p /run/nginx && mkdir /www

CMD nginx && tail -f /dev/null
