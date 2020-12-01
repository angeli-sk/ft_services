# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/30 18:06:49 by akramp        #+#    #+#                  #
#    Updated: 2020/11/30 18:39:49 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

RUN apk update && \
	apk upgrade && \
	apk add influxdb

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf
