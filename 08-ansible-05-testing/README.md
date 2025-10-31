# 08-ansible-05-testing

## 1. Molecule

### 1.1. Установка Molecule на Ubuntu 24.04 WSL

  ```
  sudo apt install -y python3 python3-pip libssl-dev libffi-dev pipx
  pipx ensurepath
  pipx install molecule
  pipx inject molecule ansible-core ansible-lint molecule-plugins[docker,podman] docker podman ansible-dev-tools jinja2
  ```

  `molecule list`
  
  <img width="928" height="286" alt="Снимок экрана 2025-07-20 164203" src="https://github.com/user-attachments/assets/a4abece4-f912-4798-98a0-0619d79e3f0b" />
  
  `molecule drivers`
  
  <img width="912" height="233" alt="image" src="https://github.com/user-attachments/assets/6d77e267-575e-448e-9262-92cdca71bc2c" />
  
  `molecule version`
  
  <img width="1424" height="303" alt="Снимок экрана 2025-07-20 164812" src="https://github.com/user-attachments/assets/b0b141b9-f7c5-4bec-a5ed-7abde85a064a" />
  
  `ansible version`
  
  <img width="1159" height="235" alt="Снимок экрана 2025-07-20 164851" src="https://github.com/user-attachments/assets/f9ccf3a9-2c9b-465c-8348-699f59df55c9" />

### 1.2. Результат выполнения тестов:

  Ссылка на репозиторий:

  https://github.com/DioRoman/08-ansible-05-testing/tree/main/vector/molecule/default

  <details><summary>Вывод команды molecule test -s default</summary>
  
```
dio@dio-mainpc:/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector$ molecule test -s default
WARNING  Driver docker does not provide a schema.
INFO     default scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
WARNING  Another version of 'ansible.posix' 1.5.4 was found installed in /usr/lib/python3/dist-packages/ansible_collections, only the first one will be used, 2.0.0 (/home/dio/.ansible/collections/ansible_collections).
WARNING  Another version of 'community.docker' 3.7.0 was found installed in /usr/lib/python3/dist-packages/ansible_collections, only the first one will be used, 4.6.1 (/home/dio/.ansible/collections/ansible_collections).
WARNING  Another version of 'community.library_inventory_filtering_v1' 1.0.0 was found installed in /usr/lib/python3/dist-packages/ansible_collections, only the first one will be used, 1.1.1 (/home/dio/.ansible/collections/ansible_collections).
WARNING  Another version of 'containers.podman' 1.11.0 was found installed in /usr/lib/python3/dist-packages/ansible_collections, only the first one will be used, 1.17.0 (/home/dio/.ansible/collections/ansible_collections).
INFO     Running default > dependency
WARNING  Skipping, dependency is disabled.
WARNING  Skipping, dependency is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=ubuntu-instance)
ok: [localhost] => (item=debian-instance)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

playbook: /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/molecule/default/converge.yml
INFO     Running default > create
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=ubuntu-instance)
ok: [localhost] => (item=debian-instance)

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Synchronization the context] *********************************************
changed: [localhost] => (item=ubuntu-instance)
ok: [localhost] => (item=debian-instance)

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item=unix://var/run/docker.sock)
ok: [localhost] => (item=unix://var/run/docker.sock)

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Build an Ansible compatible image (new)] *********************************
ok: [localhost] => (item=molecule_local/ubuntu:22.04)
ok: [localhost] => (item=molecule_local/debian:bookworm-slim)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item=ubuntu-instance)
ok: [localhost] => (item=debian-instance)

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

PLAY RECAP *********************************************************************
localhost                  : ok=9    changed=4    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [Include vector role] *****************************************************

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install dependencies] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create installation directory] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Download Vector] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Extract Vector] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install Vector binary] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector group] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector user] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Add vector to adm group (for log access)] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create directories] ***
changed: [debian-instance] => (item={'path': '/etc/vector'})
changed: [ubuntu-instance] => (item={'path': '/etc/vector'})
changed: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
ok: [debian-instance] => (item={'path': '/var/lib/vector'})
changed: [ubuntu-instance] => (item={'path': '/var/log/vector'})
changed: [debian-instance] => (item={'path': '/var/log/vector'})

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy config] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy systemd service] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Start Vector directly] ***
ok: [debian-instance]
ok: [ubuntu-instance]

PLAY RECAP *********************************************************************
debian-instance            : ok=13   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=13   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running default > idempotence
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [Include vector role] *****************************************************

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install dependencies] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create installation directory] ***
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Download Vector] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Extract Vector] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install Vector binary] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector group] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector user] ***
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Add vector to adm group (for log access)] ***
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create directories] ***
ok: [debian-instance] => (item={'path': '/etc/vector'})
ok: [ubuntu-instance] => (item={'path': '/etc/vector'})
ok: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
ok: [debian-instance] => (item={'path': '/var/lib/vector'})
ok: [ubuntu-instance] => (item={'path': '/var/log/vector'})
ok: [debian-instance] => (item={'path': '/var/log/vector'})

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy config] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy systemd service] ***
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Start Vector directly] ***
ok: [ubuntu-instance]
ok: [debian-instance]

PLAY RECAP *********************************************************************
debian-instance            : ok=13   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=13   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier
INFO     ansible-playbook version: ansible-playbook
  config file = /home/dio/.ansible/tmp/molecule.sNUc.default/ansible.cfg
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

PLAY [Verify Vector installation and configuration] ****************************

TASK [Check if Vector is running] **********************************************
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [Display Vector status] ***************************************************
ok: [debian-instance] => {
    "vector_status.stdout": "not running"
}
ok: [ubuntu-instance] => {
    "vector_status.stdout": "running"
}

TASK [Validate Vector config file syntax] **************************************
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [Assert Vector config is valid] *******************************************
ok: [debian-instance] => {
    "changed": false,
    "msg": "Vector config is valid."
}
ok: [ubuntu-instance] => {
    "changed": false,
    "msg": "Vector config is valid."
}

TASK [Check Vector version (дополнительно)] ************************************
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [Print Vector version (для информации)] ***********************************
ok: [debian-instance] => {
    "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
}
ok: [ubuntu-instance] => {
    "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
}

PLAY RECAP *********************************************************************
debian-instance            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     ansible-playbook version: ansible-playbook
  config file = /home/dio/.ansible/tmp/molecule.sNUc.default/ansible.cfg
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory

```
</details>

## 2. Tox

### 2.1. Установка molecule на Ubuntu 24.04 WSL

  `pipx install tox`
  
  `tox --version`
  
  <img width="894" height="63" alt="Снимок экрана 2025-07-20 170112" src="https://github.com/user-attachments/assets/3cef62c3-bae8-4690-b3b8-3881d67fee0e" />

### 2.2. Сценарий для Tox

  Ссылка на репозиторий

  Tox.ini

  https://github.com/DioRoman/08-ansible-05-testing/blob/main/vector/tox.ini

  tox-requirements.txt

  https://github.com/DioRoman/08-ansible-05-testing/blob/main/vector/tox-requirements.txt

  Сценарий:
  
  https://github.com/DioRoman/08-ansible-05-testing/tree/main/vector/molecule/tox
  
  <details><summary>Вывод команды tox</summary>

```
dio@dio-mainpc:/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector$ tox
py310-ansible30: commands[0]> python --version
Python 3.10.18
py310-ansible30: commands[1]> ansible --version
ansible [core 2.17.13]
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/lib/python3.10/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/ansible
  python version = 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True
py310-ansible30: commands[2]> molecule test -s tox
WARNING  Driver podman does not provide a schema.
INFO     tox scenario test matrix: destroy, dependency, create, converge, verify, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Running tox > destroy
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/lib/python3.10/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/ansible-playbook
  python version = 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j764887851870.1298', 'results_file': '/home/dio/.ansible_async/j764887851870.1298', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j489638851992.1334', 'results_file': '/home/dio/.ansible_async/j489638851992.1334', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running tox > create
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/lib/python3.10/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/ansible-playbook
  python version = 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="ubuntu-instance registry username: None specified") 
skipping: [localhost] => (item="debian-instance registry username: None specified") 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: Dockerfile.ubuntu)
ok: [localhost] => (item=Dockerfile: Dockerfile.debian)

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item="Dockerfile: Dockerfile.ubuntu; Image: ubuntu:22.04")
changed: [localhost] => (item="Dockerfile: Dockerfile.debian; Image: debian:bookworm-slim")

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=ubuntu-instance)
ok: [localhost] => (item=debian-instance)

TASK [Build an Ansible compatible image] ***************************************
changed: [localhost] => (item=ubuntu:22.04)
changed: [localhost] => (item=debian:bookworm-slim)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="ubuntu-instance command: sleep infinity")
ok: [localhost] => (item="debian-instance command: sleep infinity")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=ubuntu-instance: None specified) 
skipping: [localhost] => (item=debian-instance: None specified) 
skipping: [localhost]

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

PLAY RECAP *********************************************************************
localhost                  : ok=11   changed=5    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running tox > converge
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/lib/python3.10/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/ansible-playbook
  python version = 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [Include vector role] *****************************************************
included: /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector for debian-instance, ubuntu-instance

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install dependencies] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create installation directory] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Download Vector] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Extract Vector] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install Vector binary] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector group] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector user] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Add vector to adm group (for log access)] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create directories] ***
changed: [ubuntu-instance] => (item={'path': '/etc/vector'})
changed: [debian-instance] => (item={'path': '/etc/vector'})
changed: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
ok: [debian-instance] => (item={'path': '/var/lib/vector'})
changed: [ubuntu-instance] => (item={'path': '/var/log/vector'})
changed: [debian-instance] => (item={'path': '/var/log/vector'})

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy config] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy systemd service] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Start Vector directly] ***
ok: [ubuntu-instance]
ok: [debian-instance]

PLAY RECAP *********************************************************************
debian-instance            : ok=14   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=14   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > verify
INFO     Running Ansible Verifier
INFO     ansible-playbook version: ansible-playbook
  config file = /home/dio/.ansible/tmp/molecule.sNUc.tox/ansible.cfg
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/lib/python3.10/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/ansible-playbook
  python version = 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Verify Vector installation and configuration] ****************************

TASK [Check if Vector is running] **********************************************
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [Display Vector status] ***************************************************
ok: [debian-instance] => {
    "vector_status.stdout": "not running"
}
ok: [ubuntu-instance] => {
    "vector_status.stdout": "running"
}

TASK [Check Vector version (дополнительно)] ************************************
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [Print Vector version (для информации)] ***********************************
ok: [debian-instance] => {
    "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
}
ok: [ubuntu-instance] => {
    "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
}

PLAY RECAP *********************************************************************
debian-instance            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running tox > destroy
INFO     ansible-playbook version: ansible-playbook
  config file = /home/dio/.ansible/tmp/molecule.sNUc.tox/ansible.cfg
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/lib/python3.10/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/ansible-playbook
  python version = 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py310-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j535499465621.17819', 'results_file': '/home/dio/.ansible_async/j535499465621.17819', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j280200307433.17857', 'results_file': '/home/dio/.ansible_async/j280200307433.17857', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
py310-ansible30: OK ✔ in 6 minutes 55.62 seconds
py312-ansible30: commands[0]> python --version
Python 3.12.3
py312-ansible30: commands[1]> ansible --version
ansible [core 2.18.7]
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/ansible
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True
py312-ansible30: commands[2]> molecule test -s tox
WARNING  Driver podman does not provide a schema.
INFO     tox scenario test matrix: destroy, dependency, create, converge, verify, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Running tox > destroy
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True
INFO     Sanity checks: 'podman'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j493357727909.18170', 'results_file': '/home/dio/.ansible_async/j493357727909.18170', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j320101260000.18206', 'results_file': '/home/dio/.ansible_async/j320101260000.18206', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running tox > create
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="ubuntu-instance registry username: None specified") 
skipping: [localhost] => (item="debian-instance registry username: None specified") 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: Dockerfile.ubuntu)
ok: [localhost] => (item=Dockerfile: Dockerfile.debian)

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item="Dockerfile: Dockerfile.ubuntu; Image: ubuntu:22.04")
changed: [localhost] => (item="Dockerfile: Dockerfile.debian; Image: debian:bookworm-slim")

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=ubuntu-instance)
ok: [localhost] => (item=debian-instance)

TASK [Build an Ansible compatible image] ***************************************
changed: [localhost] => (item=ubuntu:22.04)
changed: [localhost] => (item=debian:bookworm-slim)

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="ubuntu-instance command: sleep infinity")
ok: [localhost] => (item="debian-instance command: sleep infinity")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=ubuntu-instance: None specified) 
skipping: [localhost] => (item=debian-instance: None specified) 
skipping: [localhost]

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item=ubuntu-instance)
changed: [localhost] => (item=debian-instance)

PLAY RECAP *********************************************************************
localhost                  : ok=11   changed=5    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running tox > converge
INFO     ansible-playbook version: ansible-playbook
  config file = None
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [Include vector role] *****************************************************
included: /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector for debian-instance, ubuntu-instance

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install dependencies] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create installation directory] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Download Vector] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Extract Vector] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Install Vector binary] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector group] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create vector user] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Add vector to adm group (for log access)] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Create directories] ***
changed: [debian-instance] => (item={'path': '/etc/vector'})
changed: [ubuntu-instance] => (item={'path': '/etc/vector'})
ok: [debian-instance] => (item={'path': '/var/lib/vector'})
changed: [ubuntu-instance] => (item={'path': '/var/lib/vector'})
changed: [debian-instance] => (item={'path': '/var/log/vector'})
changed: [ubuntu-instance] => (item={'path': '/var/log/vector'})

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy config] ***
changed: [debian-instance]
changed: [ubuntu-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Deploy systemd service] ***
changed: [ubuntu-instance]
changed: [debian-instance]

TASK [/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector : Start Vector directly] ***
ok: [debian-instance]
ok: [ubuntu-instance]

PLAY RECAP *********************************************************************
debian-instance            : ok=14   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=14   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > verify
INFO     Running Ansible Verifier
INFO     ansible-playbook version: ansible-playbook
  config file = /home/dio/.ansible/tmp/molecule.sNUc.tox/ansible.cfg
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Verify Vector installation and configuration] ****************************

TASK [Check if Vector is running] **********************************************
ok: [ubuntu-instance]
ok: [debian-instance]

TASK [Display Vector status] ***************************************************
ok: [debian-instance] => {
    "vector_status.stdout": "not running"
}
ok: [ubuntu-instance] => {
    "vector_status.stdout": "running"
}

TASK [Check Vector version (дополнительно)] ************************************
ok: [debian-instance]
ok: [ubuntu-instance]

TASK [Print Vector version (для информации)] ***********************************
ok: [debian-instance] => {
    "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
}
ok: [ubuntu-instance] => {
    "vector_version.stdout": "vector 0.48.0 (x86_64-unknown-linux-gnu a67e4e2 2025-06-30 18:25:45.272082383)"
}

PLAY RECAP *********************************************************************
debian-instance            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu-instance            : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running tox > destroy
INFO     ansible-playbook version: ansible-playbook
  config file = /home/dio/.ansible/tmp/molecule.sNUc.tox/ansible.cfg
  configured module search path = ['/home/dio/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/lib/python3.12/site-packages/ansible
  ansible collection location = /home/dio/.ansible/collections:/usr/share/ansible/collections
  executable location = /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector/.tox/py312-ansible30/bin/python)
  jinja version = 3.1.6
  libyaml = True

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})
changed: [localhost] => (item={'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j785826387456.34618', 'results_file': '/home/dio/.ansible_async/j785826387456.34618', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.ubuntu', 'image': 'ubuntu:22.04', 'name': 'ubuntu-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j197670094546.34656', 'results_file': '/home/dio/.ansible_async/j197670094546.34656', 'changed': True, 'item': {'command': 'sleep infinity', 'dockerfile': 'Dockerfile.debian', 'image': 'debian:bookworm-slim', 'name': 'debian-instance', 'pre_build_image': False, 'tmpfs': ['/tmp', '/run']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
  py310-ansible30: OK (415.62=setup[0.25]+cmd[0.02,4.25,411.10] seconds)
  py312-ansible30: OK (514.41=setup[0.11]+cmd[0.02,5.30,508.97] seconds)
  congratulations :) (930.22 seconds)
```
</details>

<details><summary>Различные команды/рабочий материал</summary>
  
```

cd /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/clickhouse

cd /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/lighthouse

cd /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector

ansible-galaxy role init clickhouse

molecule init scenario -d docker

molecule test

molecule test --destroy=never - запуск полного сценария тестирования без разрушения инфраструктуры после прогона

molecule login

molecule verify

docker run --privileged=True -v /mnt/c/Users/rlyst/Netology/08-ansible-05-testing/vector:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash

Tox

rm -rf .tox/

tox -v

ansible-galaxy collection install -f containers.podman

pipx install tox

pipx install molecule-podman

molecule drivers

molecule init scenario tox --driver-name podman

molecule test -s tox --destroy=never 
```

</details>

