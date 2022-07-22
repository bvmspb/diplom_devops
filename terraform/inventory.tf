resource "local_file" "inventory" {
  content  = <<-DOC
    ---
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.
    nginx:
      hosts:
        node01_nginx:
          ansible_host: ${yandex_compute_instance.node01-nginx.network_interface.0.nat_ip_address}

    master:
      vars:
        mysql_replication_role: "master"
      hosts:
        db01:
          ansible_host: ${yandex_compute_instance.node02-db01.network_interface.0.ip_address}

    slave:
      vars:
        mysql_replication_role: "slave"
      hosts:
        db02:
          ansible_host: ${yandex_compute_instance.node03-db02.network_interface.0.ip_address}

    dbservers:
      children:
        master:
        slave:
      vars:
        database_name: ${var.database_name}
        database_user: ${var.database_user}
        database_password: ${var.database_password}
        mysql_replication_user: ${var.database_replication_user}
        mysql_replication_user_password: ${var.database_replication_user_password}
        mysql_replication_master: ${var.database_replication_masternode}

    behind_proxy:
      vars:
        ansible_ssh_common_args: '-o StrictHostKeyChecking=no -o ProxyCommand="ssh -W %h:%p -q ubuntu@{{ domain_name }}"'
      children:
        dbservers:
        www:

    www:
      hosts:
        app:
          ansible_host: ${yandex_compute_instance.node04-app.network_interface.0.ip_address}

    DOC
  filename = "../ansible/inventory/stage.yml"

  depends_on = [
    yandex_compute_instance.node01-nginx,
    yandex_compute_instance.node02-db01,
    yandex_compute_instance.node03-db02,
    yandex_compute_instance.node04-app
  ]
}