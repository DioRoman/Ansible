cd /mnt/c/Users/rlyst/Netology/ter_vm_dev/src

cd /mnt/c/Users/rlyst/Netology/08-ansible-03-yandex/playbook

ansible-playbook -i inventory/hosts.yml vector.yml --limit "vector"

ansible-playbook -i inventory/hosts.yml clickhouse.yml --limit "clickhouse"

ansible-playbook -i inventory/hosts.yml lighthouse.yml --limit "lighthouse"

terraform destroy -auto-approve && terraform apply -auto-approve

ansible-lint clickhouse.yml

ansible-lint lighthouse.yml

sudo truncate -s 0 /var/log/syslog

ansible-galaxy install -r requirements.yml

ansible-galaxy install -r requirements.yml -p roles

ansible-galaxy install -r requirements.yml -p roles --force-with-deps

cd /mnt/c/Users/rlyst/Netology/08-ansible-04-role/playbook