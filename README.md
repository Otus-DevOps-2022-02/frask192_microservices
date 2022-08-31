# frask192_microservices
frask192 microservices repository

#########################################################################################
## HW 13 docer micro

docker rm $(docker ps -a -q) - удалить все не запущеные контейнеры
docker rmi $(docker images -q) - удалить все образы

docker logs reddit -f - поток логов контейнера
docker tag src dst - переименовать контейнер или сделать с тегом репозитория в который пушить

был создандокер образ с скриптом установки в нем монгоДБ, конфигов и сервиса puma
залил образ в свой репозиторий

#########################################################################################
## HW 14 docker network compose tests

docker network connect <network> <container> - подключить контейнер к сети
COMPOSE_PROJECT_NAME=OTUS - вот так в .env задается имя проекта

 создан docker-compose файл для сборки и запуска наших приложений

#########################################################################################
## HW 15 gitlab

yc compute instance create   --name gitlab-ci-vm   --zone ru-central1-a   --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4   --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=50   --ssh-key ~/.ssh/id_rsa.pub  --memory=6G --cores=2 --core-fraction=20 --platform=standard-v3 --preemptible=true  ## делаем ВМ на ice lake, 20% процессорного времени и прерываемую для удешевления

docker-machine create  --driver generic  --generic-ip-address=IP --generic-ssh-user yc-user  --generic-ssh-key ~/.ssh/id_rsa  docker-host

sudo docker exec -it gitlab_web_1 grep 'Password:' /etc/gitlab/initial_root_password ### узнать root пароль из контейнера ранера

#########################################################################################
## HW 16 monitoring prometheus exporters

yc compute instance create   --name docker-host   --zone ru-central1-a   --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4   --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=15   --ssh-key ~/.ssh/id_rsa.pub  --memory=5G --cores=2 --core-fraction=20 --platform=standard-v3 --preemptible=true

#########################################################################################
## HW 17 logging EFK Zipkin

yc compute instance create   --name logging   --zone ru-central1-a   --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4   --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=15   --ssh-key ~/.ssh/id_rsa.pub  --memory=4G --cores=2 --core-fraction=20 --platform=standard-v3 --preemptible=true

#########################################################################################
## HW 18 k8s-1

при помощи терраформ создал машины для кубера
дальше следовать командам commands_for_install.txt для установки и запуска кубера

#########################################################################################
## HW 18 k8s-2

скачал и поднял миникуб
https://kubernetes.io/docs/tasks/tools/install-minikube/

убежились, что kubectl смотрит на наш миникуб - kubectl config current-context
создали работчие манифесты reddit приложений для кубернетиса и запуслили их в миникубе - kubectl apply -f ./kubernetes/reddit (прочитать все манифесты) или на конкретный файл kubectl apply -f ./kubernetes/reddit/ui-deployment.yml

пробросили порт ui и убедились что приложение работает - kubectl get pods --selector component=ui kubectl port-forward 8080:9292

для связи компонентов между собой и для пбликации наружу исрользуются манифесты, описанные как <appname>-service.yaml

для публикации наружу можно указать конкретный порт
spec:
  type: NodePort
  ports:
  - nodePort: 32092
    port: 9292
    protocol: TCP
    targetPort: 9292

а можно указать просто 
spec:
  type: NodePort
  ports:
  - port: 9292
    protocol: TCP
    targetPort: 9292
и будет присвоен порт из диапазано 30000-32670

создавние своего namespace описано в dev-namespace.yml

#########################################################################################
## HW 19 k8s-3

Настрол Network Policy
Создал в YC дисовое пространство для k8s, подключил к кластеру k8s средствами PersistentVolume
подключил к mongo при помощи добавления к деплою PersistantVolumeClaim
