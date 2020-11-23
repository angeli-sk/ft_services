cd /www
while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done
wp config create --dbname=wordpress --dbuser=mysql --dbpass=password --dbhost=mysql:3306
# wp db create
wp core install --title=wordpress --admin_user=angi --admin_password=password --admin_email=akramp@student.codam.nl --skip-email --url=192.168.99.240:5050
wp user create jonas jbennink@student.codam.nl  --user_pass=lemao
wp user create ivy ivan-tol@student.codam.nl --user_pass=fluffy
wp user create ingmar ikole@student.codam.nl --user_pass=doggo
php-fpm7
nginx
while true; do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1 ]; then break
	fi
done
