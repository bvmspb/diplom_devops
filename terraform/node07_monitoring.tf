resource "yandex_compute_instance" "node07-monitoring" {
  name     = "node07-monitoring"
  zone     = var.yc_region2
  hostname = "monitoring.${var.domain_name}"
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
      name     = "root-node07-monitoring"
      type     = "network-nvme"
      size     = "10"
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
