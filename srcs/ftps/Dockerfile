# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/28 16:11:18 by akramp        #+#    #+#                  #
#    Updated: 2020/11/30 15:17:33 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

RUN apk update && \
	apk add openssl && \
	apk add vsftpd && \
	apk add jq --no-cache

RUN mkdir -p /ftps

RUN openssl genrsa -out /etc/ssl/certs/domain.key 2048 && \
	openssl req -x509 -days 356 -nodes -new -key /etc/ssl/certs/domain.key \
    -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=domain' -out /etc/ssl/certs/domain.crt

RUN adduser -D user -h /ftps
RUN echo "user:user" | chpasswd

EXPOSE 21 30021

COPY setup.sh /
RUN chmod +x /setup.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
#RUN echo "pasv_address=192.168.99.240" >> /etc/vsftpd/vsftpd.conf
CMD ./setup.sh
#CMD vsftpd /etc/vsftpd/vsftpd.conf
