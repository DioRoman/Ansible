#!/bin/bash

# Запускаем контейнеры в фоновом режиме (-d)
docker run -d --name centos7 centos:7 sleep 7200
docker run -d --name debian-python debian-python sleep 7200
docker run -d --name fedora pycontribs/fedora:latest sleep 7200

# Запускаем Ansible playbook с запросом пароля для vault
ansible-playbook playbook/site.yml -i playbook/inventory/prod.yml --ask-vault-pass

# Останавливаем контейнеры
docker stop centos7 debian-python fedora

# Удаляем контейнеры
docker rm centos7 debian-python fedora