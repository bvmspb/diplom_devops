terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "netology-bvmspb"
    region     = "ru-central1"
    key        = "[terraform.workspace]/terraform-stage.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
