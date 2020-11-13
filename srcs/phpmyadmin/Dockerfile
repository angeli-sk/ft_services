# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/09 15:59:28 by akramp        #+#    #+#                  #
#    Updated: 2020/11/09 17:43:26 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.7

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

# apk add gnupg nginx php7-fpm php7-common php7-iconv php7-json php7-gd \
# 	php7-curl php7-xml php7-mysqli php7-imap php7-pdo php7-pdo_mysql \
# 	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
# 	php7-ctype php7-dom php7-session php7-mbstring curl \
