# Variables
variable "yc_token" {
  default = ""
}

variable "yc_cloud_id" {
  default = ""
}

variable "yc_folder_id" {
  default = ""
}

variable "domain_name" {
  default = "bvm.pw"
}

variable "test_cert" {
  default = "--test-cert" // TEST
//  default = "" // PROD
// Использовать "" для PROD и "--test-cert" для TEST SSL certificate
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
#ubuntu-2004 - fd81u2vhv3mc49l1ccbb
variable "image_id" {
  default = "fd81u2vhv3mc49l1ccbb"
}

# Уровень производительности CPU - позволяет заметно сэкономить на стоимости ВМ
# https://cloud.yandex.ru/docs/compute/concepts/performance-levels
variable "core_fraction" {
  type = number
  default = 20
}

# "Перываемая ВМ" - для экономии денег лучше ставить в true, для надежности в false
# https://cloud.yandex.ru/docs/compute/operations/vm-create/create-preemptible-vm#create-preemptible
variable "preemptible" {
  type = bool
  default = true
}

variable "yc_region" {
  default = "ru-central1-a"
}

variable "yc_region2" {
  default = "ru-central1-b"
}

variable "nat_ip_address" {
  default = "62.84.114.35"
}

