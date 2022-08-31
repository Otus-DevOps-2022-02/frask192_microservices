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
