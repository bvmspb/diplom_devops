install-certbot
=========

Простая роль, отвечающая за установку certbot snap пакета. Не использовать в реальной жизни - только для обучения.

Requirements
------------

```bash
ansible-galaxy collection install community.general
```

Role Variables
--------------

None

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- name: Install certbot
  hosts: nginx
  remote_user: ubuntu
  roles:
    - install-certbot
```

License
-------

MIT

Author Information
------------------

Vladimir Baksheev