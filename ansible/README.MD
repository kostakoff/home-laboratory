# Ansible configuration skeleton
It is an implementation of ansible best practice skeleton \
described here https://web.archive.org/web/20240331135623/https://books.stuartherbert.com/putting-ansible-to-work/organising-your-ansible-files.html

## Installation steps

- Installation, repare, update server:
```bash
ansible-playbook -vvv playbooks/all.yaml -i inventory/hosts.yaml --tags linux-sonar-cli
```

# Ansible pipeline steps

