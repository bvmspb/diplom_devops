install-monitoring
=========

Простая роль, отвечающая за установку node_exporter. Не использовать в реальной жизни - только для обучения.

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
- name: Install node-exporter
  hosts: node_exporter_nodes

  remote_user: ubuntu
  roles:
    - install-node-exporter
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