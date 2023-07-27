

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

/*variable "vm_db_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name_of_instance"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "count_of_cores_vm"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "count_of_memory_vm"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "core_fraction_of_vm"
}*/


