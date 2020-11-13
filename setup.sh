sh ./srcs/peercleanup.sh
minikube start --driver=virtualbox
minikube addons enable dashboard
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml
eval $(minikube docker-env)
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t myng ./srcs/mysql
kubectl apply -k ./srcs/wordpress
minikube dashboard
