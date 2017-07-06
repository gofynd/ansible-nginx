ansible-nginx
=========

This role installs and sets up Nginx web server.

Requirements
------------

This role requires Ansible 2.2 or higher. It has been tested on Ubuntu Xenial

Role Variables
--------------

A list of role variables with their descriptions is below

```yaml

# Name of user and group through which nginx runs
nginx_user: www-data
nginx_group: www-data

# Max number of concurrent connections opened by a worker process
nginx_max_clients: 768

# Log file directories
nginx_log_dir: /var/log/nginx
nginx_access_log_name: "access.log"
nginx_error_log_name: "error.log"

# Set this to true if you're terminating SSL over nginx
nginx_ssl_termination: false
ssl_dest_dir: /etc/nginx/ssl

# Nginx pid file path
nginx_pid_file: /var/run/nginx.pid

# Nginx default HTTP Params
nginx_http_params:
  sendfile: "on"
  tcp_nopush: "on"
  tcp_nodelay: "on"
  keepalive_timeout: 65
  types_hash_max_size: 2048
  client_max_body_size: "2M"
  gzip_vary: "on"
  gzip_proxied: "any"
  gzip_comp_level: 6
  gzip_buffers: "16 8k"
  gzip_http_version: 1.1
  gzip_types: "text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript"

# Set this to true to to enable basic auth over nginx along with the variable below it
nginx_basic_auth_required: false
nginx_basic_auth_users:
  - user_name: foo
    password: bar
nginx_htpasswd_file_path: /etc/nginx/.htpasswd

# Name of site config template
site_config_name: '""'
nginx_config_path: /etc/nginx/sites-available/{{ site_config_name }}

nginx_base_config: nginx.conf.j2
nginx_base_config_path: /etc/nginx/nginx.conf

# Name of the application. Set this variable when enabling SSL termination
application_name : '""'

```

Dependencies
------------

None

Example Playbook
----------------
- Install nginx with a custom site template

```
  hosts:
   - webservers

  roles:
    - nginx

  vars_files:
    - vars/nginx.yml
    
  vars:
    - nginx_template: "{{ playbook_dir }}/templates/mysite_nginx_config.j2"

```

License
-------

BSD

Author Information
------------------

Fynd
