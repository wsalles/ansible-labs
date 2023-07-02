# MySQL - Restoring DB

This Ansible Role is used for restore MySQL Database from file in remote server.

---

Requirements
------------

- ansible >= 2.14.3
- MySQLdb (Python 2.x)
- PyMySQL (Python 2.7 and Python 3.X), or
- mysql (command line binary)
- mysqldump (command line binary)

---

## Role Variables

Set variables in vars/main.yml file:

dir_backups: Directory for stored backups files in remote server
time: Variable with date time for your backup which you wish restore. This variable has seted in runtime. Example:

```
  --extra-vars time=20230419 (YYYYMMDD)
```

dbname: Set db name for restore.   This variable has seted in runtime. Example:

```
  --extra-vars dbname=ansible
```

---

## Usage Example

```yaml
- name: Main Playbook
  hosts: all
  roles:
    - mysql-restoredb
```
