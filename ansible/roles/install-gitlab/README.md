install-gitlab
=========

Простая роль, отвечающая за установку Gitlab. Не использовать в реальной жизни - только для обучения.

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
- name: Install Gitlab
  hosts: gitlab
  remote_user: ubuntu
  roles:
    - install-gitlab
  environment:
    http_proxy: 'http://{{ nginx_local_ip }}:3128'
    https_proxy: 'http://{{ nginx_local_ip }}:3128'
    GITLAB_OMNIBUS_CONFIG: "external_url 'http://gitlab.{domain_name}/'; gitlab_rails['initial_root_password'] = '{{gitlab_root_password}}'"
    GITLAB_ROOT_PASSWORD: "{{gitlab_root_password}}"
```

License
-------

MIT

Author Information
------------------

Vladimir Baksheev