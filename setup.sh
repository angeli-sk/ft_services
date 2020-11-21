sh ./srcs/peercleanup.sh
minikube start --driver=virtualbox --disk-size=5GB
minikube addons enable dashboard
minikube addons enable metallb

kubectl apply -f ./srcs/metallb/metallb.yaml
eval $(minikube docker-env)

docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml
docker build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml
minikube dashboard
