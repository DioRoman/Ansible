# Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

`ansible -m ping localhost`
`ansible-playbook site.yml -i inventory/test.yml`

![Снимок экрана 2025-06-24 183026](https://github.com/user-attachments/assets/6d65f43e-7632-42c0-bcff-8386447bf50b)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

`docker run -d --name centos7 centos:7 sleep 7200`
`docker run -d --name debian-python debian-python sleep 7200`

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

`ansible-playbook site.yml -i inventory/prod.yml`

![Снимок экрана 2025-06-24 214852](https://github.com/user-attachments/assets/6cd833b7-e551-4016-b6b1-74e1080d03df)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

![Снимок экрана 2025-06-24 215058](https://github.com/user-attachments/assets/1c3cdfdc-1b55-45e1-9898-0755c7e124a5)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

`ansible-vault encrypt group_vars/deb/* --vault-password-file <(echo "netology")`
`ansible-vault encrypt group_vars/el/* --vault-password-file <(echo "netology")`

![Снимок экрана 2025-06-24 230914](https://github.com/user-attachments/assets/c0bb9f5e-358f-4e92-a19e-09d998ea7a23)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

`ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass`

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

`ansible-doc -t connection -l`
`ansible-doc -t connection -l | grep docker`

![Снимок экрана 2025-06-24 222044](https://github.com/user-attachments/assets/ed58a967-ebff-4c43-bfc1-363380b9b810)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

https://github.com/DioRoman/08-ansible-01-base/blob/main/playbook/inventory/prod.yml

12. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

`ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass`

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

https://github.com/DioRoman/08-ansible-01-base/tree/main
  
14. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.

`ansible-vault decrypt group_vars/deb/*`
`ansible-vault decrypt group_vars/el/*`

![Снимок экрана 2025-06-24 223013](https://github.com/user-attachments/assets/92afcc17-22d9-47d6-8904-d6f7ddf000a3)

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.

`ansible-vault encrypt_string`

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.

`ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass`

![Снимок экрана 2025-06-24 224004](https://github.com/user-attachments/assets/4c917665-4e98-4441-a35d-39b2deb25169)

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

`docker run -d --name fedora pycontribs/fedora:latest sleep 7200`

![Снимок экрана 2025-06-24 224656](https://github.com/user-attachments/assets/348723ae-cf12-4c64-a92b-99ba656c1fd8)

5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.

https://github.com/DioRoman/08-ansible-01-base/blob/main/dio.sh

6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.
