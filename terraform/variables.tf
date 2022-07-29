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

variable "database_name" {
  default = "wordpress"
}

variable "database_user" {
  default = "wordpress"
}

variable "database_password" {
  default = "wordpress"
}

variable "database_replication_masternode" {
  default = "db01"
}

variable "database_replication_user" {
  default = "replicausr"
}

variable "database_replication_user_password" {
  default = "REplicauserpass123"
}

variable "gitlab_root_password" {
  default = "gitlabroopass0rd"
}

variable "gitlab_runner_token" {
  default = "tokentokentoken"
}

variable "grafana_password" {
  default = "grafana_password"
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
  type    = number
  default = 20
}

# "Перываемая ВМ" - для экономии денег лучше ставить в true, для надежности в false
# https://cloud.yandex.ru/docs/compute/operations/vm-create/create-preemptible-vm#create-preemptible
variable "preemptible" {
  type    = bool
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

