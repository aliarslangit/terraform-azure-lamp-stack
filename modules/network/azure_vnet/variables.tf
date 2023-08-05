//------------------------------------General Properties------------------------------------\\
variable "rgname" {
  type    = string
  default = "RG-git"
}

variable "location" {
  type    = string
  default = "West US"
}

variable "vnetname" {
  type    = string
  default = ""
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  description = "Map of subnet names and their respective CIDR ranges"
  type = map
}