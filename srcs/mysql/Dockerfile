# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: angeli <angeli@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/11/11 14:21:48 by angeli        #+#    #+#                  #
#    Updated: 2020/11/12 19:38:56 by angeli        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.7

RUN apk update && \
	apk upgrade && \
	apk add mysql mysql-client

RUN addgroup mysql mysql

COPY ./my.cnf /etc/my.cnf

VOLUME /var/lib/mysql

EXPOSE 3306

RUN chown -R mysql:mysql /var/lib && \
	mkdir /run/mysqld && \
	chown mysql:mysql /run/mysqld
	
RUN :> createdatabase && \
	echo "CREATE DATABASE wordpress_db;" >> createdatabase && \  
	echo "CREATE USER 'DB_USER'@'%' IDENTIFIED BY '$ecurepassword'; " >> createdatabase && \
	echo "GRANT ALL PRIVILEGES ON *.* TO 'DB_USER'@'%';" >> createdatabase && \
	echo "FLUSH PRIVILEGES;" >> createdatabase

CMD  mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	 /usr/bin/mysqld --user=mysql --init_file=/createdatabase