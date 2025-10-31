# Задание

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

https://github.com/DioRoman/08-ansible-04-role/blob/main/playbook/requirements.yml

2. При помощи `ansible-galaxy` скачайте себе эту роль.
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.

https://github.com/DioRoman/clickhouse-role

https://github.com/DioRoman/lighthouse-role

https://github.com/DioRoman/vector-role
   
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

_Установка ролей на VM в YC_

<img width="1424" height="1095" alt="Снимок экрана 2025-07-10 005031" src="https://github.com/user-attachments/assets/379c5f20-9b03-4e89-82c5-8f162253de2f" />

<img width="1347" height="965" alt="Снимок экрана 2025-07-10 005134" src="https://github.com/user-attachments/assets/9d417227-137a-42d7-8634-e6d6293b34d7" />

<img width="1390" height="1235" alt="Снимок экрана 2025-07-10 005243" src="https://github.com/user-attachments/assets/c42bc0c0-b104-4096-a50e-22672431e68e" />

<img width="1349" height="248" alt="Снимок экрана 2025-07-10 005247" src="https://github.com/user-attachments/assets/3f7de772-cbd6-4896-be33-b8101c40b182" />
