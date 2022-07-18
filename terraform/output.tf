output "internal_ip_address_node01_nginx_yandex_cloud" {
  value = "${yandex_compute_instance.node01-nginx.network_interface.0.ip_address}"
}

output "external_ip_address_node01_nginx_yandex_cloud" {
  value = "${yandex_compute_instance.node01-nginx.network_interface.0.nat_ip_address}"
}
