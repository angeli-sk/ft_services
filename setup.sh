sh ./srcs/peercleanup.sh
minikube start --driver=virtualbox --disk-size=5GB --extra-config=kubelet.authentication-token-webhook=true
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server

kubectl apply -f ./srcs/metallb/metallb.yaml
eval $(minikube docker-env)
kubectl create serviceaccount user
kubectl apply -f ./srcs/serviceaccount/service.yaml

docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml
docker build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml
docker build -t phpmyadmin ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
docker build -t ftps ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml
docker build -t influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml
docker build -t telegraf ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/telegraf.yaml
docker build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

# kublectl apply -f ./srcs/serviceaccount/service.yaml
minikube dashboard
