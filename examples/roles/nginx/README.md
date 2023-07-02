# Nginx Community Edition

This Ansible Role is used for install [Nginx Community Edition](https://www.nginx.com/resources/wiki/community/) in the lastest version.

---

Requirements
------------

- Ansible 7.3.0+
- Targets Operatios Systems Homologated:
  - RedHat Like
    - CentOS 7.9
    - Amazon Linux V2
    - Rocky Linux

---

## Role Variables

Variables are available in vars directory. Read and change this. The required variables are:

- root_dir:

## Usage Example

```yaml
    - name: Example Playbook
      hosts: all
      roles: 
        - nginx
```
