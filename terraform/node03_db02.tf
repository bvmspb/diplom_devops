resource "yandex_compute_instance" "node03-db02" {
  name     = "node03-db02"
  zone     = var.yc_region2
  hostname = "db02.${var.domain_name}"
  resources {
    core_fraction = var.core_fraction
    cores         = 4
    memory        = 4
  }
  scheduling_policy {
    preemptible = var.preemptible
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
      name     = "root-node02-db02"
      type     = "network-nvme"
      size     = "15"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.default-ru-central1-b.id
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  depends_on = [
    yandex_vpc_subnet.default-ru-central1-b
  ]
}
