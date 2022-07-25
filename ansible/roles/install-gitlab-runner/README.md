install-gitlab-runner
=========

Простая роль, отвечающая за установку Gitlab runner. Не использовать в реальной жизни - только для обучения.

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
- name: Install Gitlab runner
  hosts: runner
  remote_user: ubuntu
  roles:
    - install-gitlab-runner
  environment:
    http_proxy: 'http://{{ nginx_local_ip }}:3128'
    https_proxy: 'http://{{ nginx_local_ip }}:3128'
```

License
-------

MIT

Author Information
------------------

Vladimir Baksheev