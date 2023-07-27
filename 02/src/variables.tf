###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

### yandex_compute_image vars

variable "vm_web_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "release_name_of_image"
}

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 1
    core_fraction  = 5
 }
}

### yandex_compute_instance vars

/*variable "vm_web_instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name_of_instance"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "count_of_cores_vm"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "count_of_memory_vm"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "core_fraction_of_vm"
}*/

###ssh vars

/*variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwyJ3A7ejWrc8zrubKHU/QnVkCiQeREs7YqXNxpPLacXVRKBSEyC5D8nFQtUZcYCprLOKFXZqwmpUH5TVn0rONjZx1R1cvO9sa3lDm6DrpbIVQqGDYCJ+GerAtzYYDnL51z+daKrT9cqa2LdvTzEWfDyB7+gujFiJrGLnFA1pJeN1x6jHj/V7hXm0y88uW/G6AZWnGfvgJzUj5B7AMdRBjR3YGDTbnjcgnHLCNoO4nefHqMBiEZ7FibNqi1GqSi243GtBVNq8BMlHZyWucPG7IeUBHZ93gf9eLbN5nGx2E4TGZIcKjSH9QYptgXEi19HDE4wqYCexCNBTuwSN2YHWBD6B3MEnwKA2R1GtNM/rH69+puXZJx3p/qidSmQwQvdsVze4uJf4v+UEJvGbg06ce9VFjfoaiLFNLNKIVP1xqrZTHtWQeX9mqYZ3KrmNvzO843Eb9nqn5fyGDjkK600bAeg6tlB+jkFNu9PY28NLiasCfnRovBtvUm2esKqWQ/BE= skvorchenkov@localhost.localdomain"
  description = "ssh-keygen -t ed25519"
}*/

variable "vms_ssh_root_key" {
  type = map(any)
  default = {
   serial-port-enable   = 1
   ssh-keys             = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwyJ3A7ejWrc8zrubKHU/QnVkCiQeREs7YqXNxpPLacXVRKBSEyC5D8nFQtUZcYCprLOKFXZqwmpUH5TVn0rONjZx1R1cvO9sa3lDm6DrpbIVQqGDYCJ+GerAtzYYDnL51z+daKrT9cqa2LdvTzEWfDyB7+gujFiJrGLnFA1pJeN1x6jHj/V7hXm0y88uW/G6AZWnGfvgJzUj5B7AMdRBjR3YGDTbnjcgnHLCNoO4nefHqMBiEZ7FibNqi1GqSi243GtBVNq8BMlHZyWucPG7IeUBHZ93gf9eLbN5nGx2E4TGZIcKjSH9QYptgXEi19HDE4wqYCexCNBTuwSN2YHWBD6B3MEnwKA2R1GtNM/rH69+puXZJx3p/qidSmQwQvdsVze4uJf4v+UEJvGbg06ce9VFjfoaiLFNLNKIVP1xqrZTHtWQeX9mqYZ3KrmNvzO843Eb9nqn5fyGDjkK600bAeg6tlB+jkFNu9PY28NLiasCfnRovBtvUm2esKqWQ/BE= skvorchenkov@localhost.localdomain"
}
  }
