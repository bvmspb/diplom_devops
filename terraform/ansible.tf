resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 60"
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
