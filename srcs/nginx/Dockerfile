# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/08 14:30:03 by akramp        #+#    #+#                  #
#    Updated: 2020/12/14 22:26:26 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

RUN apk update && \
	apk upgrade && \
	apk add nginx \
	openssl \
	openssh --no-cache

RUN mkdir -p /run/nginx && mkdir /www

#Generates new ssl certifacate
RUN openssl genrsa -out /etc/ssl/certs/domain.key 2048 && \
    openssl req -x509 -days 356 -nodes -new -key /etc/ssl/certs/domain.key \
    -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=domain' -out /etc/ssl/certs/domain.crt

#Creates ssh key and set user and password
RUN ssh-keygen -A
RUN adduser -D user
RUN echo "user:user" | chpasswd

#Configures nginx
COPY ./nginx.conf etc/nginx/nginx.conf
COPY ./index.html www
COPY ./ngxstart.sh ./
RUN chmod +x ngxstart.sh

EXPOSE 80 443 22

CMD ./ngxstart.sh
# CMD nginx && /usr/sbin/sshd && tail -f /dev/null
