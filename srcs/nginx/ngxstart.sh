nginx
/usr/sbin/sshd

while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep sshd
	if [ $? == 1 ]; then break
	fi
done
