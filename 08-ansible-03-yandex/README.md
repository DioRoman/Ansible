# Домашнее задание к занятию 3 «Использование Ansible»

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
4. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

https://github.com/DioRoman/08-ansible-03-yandex/blob/main/playbook/lighthouse.yml

5. Подготовьте свой inventory-файл `prod.yml`.

https://github.com/DioRoman/08-ansible-03-yandex/blob/main/playbook/inventory/hosts.yml

6. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

![Снимок экрана 2025-07-06 195314](https://github.com/user-attachments/assets/ab5cbe8c-407c-45d2-8e38-97ebd1673a26)

7. Попробуйте запустить playbook на этом окружении с флагом `--check`.
8. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
9. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

![Снимок экрана 2025-07-06 200027](https://github.com/user-attachments/assets/737916d2-b050-400e-a6fa-7c86240d7b5a)

![Снимок экрана 2025-07-06 195010](https://github.com/user-attachments/assets/58fc2a1c-befe-4d53-9028-11b115ba28a6)

![Снимок экрана 2025-07-06 195039](https://github.com/user-attachments/assets/0e113998-4ae9-47f0-b88a-184e9663ef9f)

10. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

https://github.com/DioRoman/08-ansible-03-yandex/blob/main/rdm.md

11. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

