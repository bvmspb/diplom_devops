output "internal_ip_address_node01_nginx_yandex_cloud" {
  value = yandex_compute_instance.node01-nginx.network_interface.0.ip_address
}

output "external_ip_address_node01_nginx_yandex_cloud" {
  value = yandex_compute_instance.node01-nginx.network_interface.0.nat_ip_address
}

output "internal_ip_address_node02_db01_yandex_cloud" {
  value = yandex_compute_instance.node02-db01.network_interface.0.ip_address
}

output "internal_ip_address_node03_db02_yandex_cloud" {
  value = yandex_compute_instance.node03-db02.network_interface.0.ip_address
}
