install-monitoring
=========

Простая роль, отвечающая за установку Prometheus, alert manager и Grafana - monotoring stack. Не использовать в реальной жизни - только для обучения.

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
- name: Install Prometheus and Grafana
  hosts: monitoring
  remote_user: ubuntu
  roles:
    - install-monitoring
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