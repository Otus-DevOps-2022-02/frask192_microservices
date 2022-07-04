terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.74.0"
    }
  }
  required_version = ">= 1.1.0"
}

data "yandex_compute_image" "my_image" {
  family = "ubuntu-1804-lts"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "k8s" {
  count       = var.count_nodes
  name        = "k8s-n${count.index}"
  platform_id = "standard-v3"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.my_image.id}"
      size     = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "sga:${file(var.public_key_path)}"
  }

}
