variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "image_id" {
  description = "Disk image"
}
# variable "app_disk_image" {
#   description = "Disk image"
# }
# variable "db_disk_image" {
#   description = "Disk image"
# }
variable "public_key_path" {
  # Описание переменной
  description = "~/.ssh/id_rsa.pub"
}
variable "service_account_key_file" {
  description = "~/.secret/key.json"
}
variable "private_key_path" {
  description = "path to provate key"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "count_nodes" {
  description = "count of nodes"
  default = 2
}
