#!/bin/bash
#Перед тем как установить Docker Ubuntu необходимо установить дополнительные пакеты ядра, которые позволяют использовать Aufs для контейнеров Docker. С помощью этой файловой системы мы сможем следить за изменениями и делать мгновенные снимки контейнеров:
sudo apt install linux-image-extra-$(uname -r) linux-image-extra-virtual
#Ещё надо установить пакеты, необходимые для работы apt по https:
sudo apt install apt-transport-https ca-certificates curl software-properties-common
#После того как все приготовления завершены и вы убедились что ваша система полностью готова, можно перейти к установке. Мы будем устанавливать программу из официального репозитория разработчиков. Сначала надо добавить ключ репозитория:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#Затем добавьте репозиторий docker в систему:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
#И установка Docker на Ubuntu:
sudo apt install -y docker-ce
#Добавление нужного пользователя в группу Docker
sudo usermod -aG docker app
#активируем изменения для группы Docker
sudo newgrp docker
#Проверка, что docker успешно и правильно установлен
sudo -u app docker run hello-world