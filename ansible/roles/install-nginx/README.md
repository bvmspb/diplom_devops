install-nginx
=========

Простая роль, отвечающая за установку nginx. Не использовать в реальной жизни - только для обучения.

Requirements
------------

None

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
- name: Install nginx
  hosts: nginx
  remote_user: ubuntu
  roles:
    - install-nginx
  post_tasks:
    - name: Nginx - create config file
      become: true
      ansible.builtin.template:
        src: nginx.conf.j2
        dest: /etc/nginx/conf.d/{{ domain_name }}.conf
      notify: reload-nginx
```

License
-------

MIT

Author Information
------------------

Vladimir Baksheev