# Network
resource "yandex_vpc_network" "default" {
  name = "default"
}

resource "yandex_vpc_subnet" "default-ru-central1-a" {
  name           = "default-ru-central1-a"
  zone           = var.yc_region
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.128.0.0/24"]

  depends_on = [
    yandex_vpc_network.default
  ]
}

resource "yandex_vpc_subnet" "default-ru-central1-b" {
  name           = "default-ru-central1-b"
  zone           = var.yc_region2
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.129.0.0/24"]

  depends_on = [
    yandex_vpc_network.default
  ]
}

