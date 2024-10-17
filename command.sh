#Build image 

docker build -t springboot-app-bitware:latest .
docker images 

# Etiqueta tu imagen
docker tag springboot-app-bitware:latest oscarcode/springboot-app-bitware:latest

# Inicia sesión en Docker Hub
docker login

# Sube la imagen a docker hub
docker push oscarcode/springboot-app-bitware:latest

docker tag springboot-app-bitware:latest oscarcode/springboot-app-bitware:latest

docker push oscarcode/springboot-app-bitware:latest

minikube kubectl -- apply -f postgres-configmap.yaml

minikube kubectl -- apply -f postgres-secret.yaml

minikube kubectl -- apply -f postgres-pvc.yaml

minikube kubectl -- apply -f postgres-deployment.yaml

minikube kubectl -- apply -f postgres-service.yaml

minikube kubectl delete service postgres

minikube service list 

kubectl get pods

kubectl port-forward pod/postgres-855f497d44-z2qb6 5432:5432

minikube kubectl -- apply -f springboot-deployment.yaml

minikube kubectl -- apply -f springboot-service.yaml

minikube kubectl -- apply -f .


