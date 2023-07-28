

### yandex_compute_image vars

variable "vm_db_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "release_name_of_image"
}

### yandex_compute_instance vars

variable "vm_db_resources" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 1
    core_fraction  = 5
  }
}


