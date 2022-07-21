resource "yandex_compute_instance" "node01-nginx" {
  name     = "node01-nginx"
  zone     = var.yc_region
  hostname = var.domain_name
  resources {
    core_fraction = var.core_fraction
    cores         = 2
    memory        = 2
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      name     = "root-node01-nginx"
      type     = "network-nvme"
      size     = "10"
    }
  }
  network_interface {
    subnet_id      = yandex_vpc_subnet.default-ru-central1-a.id
    nat            = true
    nat_ip_address = var.nat_ip_address
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  depends_on = [
    yandex_vpc_subnet.default-ru-central1-a
  ]
}
