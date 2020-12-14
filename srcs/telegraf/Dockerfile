# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: akramp <akramp@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/13 12:58:30 by akramp        #+#    #+#                  #
#    Updated: 2020/12/13 14:02:57 by akramp        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11

RUN apk update && apk upgrade && apk add wget && apk add curl

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_static_linux_amd64.tar.gz
RUN tar -zxvf telegraf-1.15.3_static_linux_amd64.tar.gz
RUN mkdir /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8125

CMD cd telegraf-1.15.3/usr && ./bin/telegraf
