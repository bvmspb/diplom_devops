//# Это первая команда, которая удаляет записи об известных ssh серверах для домена bvm.pw - при частых пересозданиях ВМ и тестировании это приводит к невозможности ProxyJump во внутреннюю виртуальную сеть через единственный сервер, доступный по внешнему ip-адресу
//# неактуально для других машин, но и не страшно, если выдаст ошибку
resource "null_resource" "clearknownhostsforbvmpw" {
  provisioner "local-exec" {
    command = "ssh-keygen -f '/home/bvm/.ssh/known_hosts' -R '${var.domain_name}'"
  }
}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 90"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "nginx" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_nginx.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}

resource "null_resource" "certbot" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_certbot.yml"
  }

  depends_on = [
    null_resource.nginx
  ]
}

resource "null_resource" "apt_proxy" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_apt_proxy.yml"
  }

  depends_on = [
    null_resource.certbot
  ]
}

resource "null_resource" "mysql" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_mysql-server.yml"
  }

  depends_on = [
    null_resource.apt_proxy
  ]
}

resource "null_resource" "wordpress" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_wordpress.yml"
  }

  depends_on = [
    null_resource.mysql
  ]
}

resource "null_resource" "gitlab" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_gitlab.yml"
  }

  depends_on = [
    null_resource.apt_proxy
  ]
}

resource "null_resource" "gitlab-runner" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_gitlab_runner.yml"
  }

  depends_on = [
    null_resource.gitlab
  ]
}

resource "null_resource" "node_exporter" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_node_exporter.yml"
  }

  depends_on = [
    null_resource.apt_proxy
  ]
}

resource "null_resource" "monitoring" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/stage.yml ../ansible/install_monitoring.yml"
  }

  depends_on = [
    null_resource.node_exporter
  ]
}