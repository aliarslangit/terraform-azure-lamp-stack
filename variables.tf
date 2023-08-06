
//------------------------------------General Properties------------------------------------\\
variable "rgname" {
  type    = string
  default = "RG-git"
}

variable "location" {
  type    = string
  default = "West US"
}
//------------------------------------VM Configurations------------------------------------\\
variable "vmname" {
  type    = string
  default = "demo-vm"
}

variable "vmuser" {
  type    = string
  default = "vmuser"
}
variable "vmpassword" {
  type    = string
  default = "*************"
}
variable "vmsize" {
  type    = string
  default = "Standard_F2"
}

variable "subnet_id" {
  type = string
  default = "0000000-000000000000-0000000000"

}
//------------------------------------OS Configurations-------------------------------------\\
variable "publisher" {
  type    = string
  default = "Canonical"
}
variable "offer" {
  type    = string
  default = "UbuntuServer"
}
variable "sku" {
  type    = string
  default = "16.04-LTS"
}
//------------------------------------VNET Configurations-------------------------------------\\
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

//------------------------------------MYSQL Configurations-------------------------------------\\
variable "db_size" {
  type        = string
  default     = ""
}
variable "db_name" {
  type        = string
  default     = ""
}
variable "subnet_name" {
  type        = string
  default     = ""
}

variable "db_server_name" {
  type        = string
  default     = ""
}
variable "dbusername" {
  type        = string
  default     = ""
}
variable "dbpassword" {
  type        = string
  default     = ""
}
//------------------------------------TAGS---------------------------------------------------\\
variable "creationdate" {
  type        = string
  default     = "1/1/1111"
  description = "description"
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "owner" {
  type = string
  default = "Ali Arslan"
}
