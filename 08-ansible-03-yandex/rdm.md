# Ansible Playbook для установки Clickhouse, LightHouse, Vector.

##  Описание
ClickHouse® — это высокопроизводительная, столбцовая система управления базами данных (СУБД) SQL для онлайн аналитической обработки (OLAP).

Vector - очередная перекладывалка логов, только в этот раз написан на blazingly fast языке программирования Rust.

LightHouse - это легкий интерфейс графического интерфейса для Clickhouse.

## Ansible Playbook
Ansible Playbook осуществляет установку данных компонентов на debian дистрибутивы Linux в Yandex Cloud через SSH.
Playbook разделены на три для каждой из задач:
 - playbook/clickhouse.yml
 - playbook/lighthouse.yml
 - playbook/vector.yml

## Необходимые действия

1. В файле playbook/group_vars/all/vars.yml укажите данные для подключения к удаленной виртуальной машине - ссылку на SHH ключ и имя пользователя.
2. В файлах playbook/group_vars/clickhouse/vars.yml и playbook/group_vars/vector/vars.yml опредлены переменные и их значения. Вы можете изменить значения, в том числе версии программного обеспечения.
3. В файл playbook/inventory/hosts.yml внесите ip адреса виртуальных машин.

## Список файлов

Папка Playbook

    clickhouse.yml - playbook для clickhouse
    lighthouse.yml - playbook для lighthouse
    vector.yml - playbook для vector
  
  Папка group_vars
  
    Папка all
      vars.yml - переменые all
    Папка clickhouse
      vars.yml - переменые clickhouse
    Папка lighthouse
      vars.yml - переменые lighthouse
    Папка vector
      vars.yml - переменые vector
      
  Папка inventory
  
    hosts.yml - inventory
    
  Папка templates
  
    lighthouse.conf.j2 - шаблон веб сервера для запуска index.html  
    
    vector.service.j2 - шаблон запуска службы vector-server
    
    vector.toml - шаблон работы vector
    
## Принципы действия playbooks

### lighthouse.yml

1. Произовдится установка веб-сервера nginx
2. Производится скачивание архива из github-репозитория "https://github.com/VKCOM/lighthouse/archive/refs/heads/master.zip"
3. Архив распаковывается в папку /var/www/lighthouse
4. Из папки template переносится конфигурация запуска сервера nginx.

### clickhouse.yml

### vector.yml


