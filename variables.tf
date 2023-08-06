
//------------------------------------General Properties------------------------------------\\
variable "rgname" {
  type    = string
  default = "rg-lamp"
}

variable "location" {
  type    = string
  default = "East US"
}
//------------------------------------VM Configurations------------------------------------\\
variable "vmname" {
  type    = string
  default = "lamp-vm"
}

variable "vmuser" {
  type    = string
  default = "azureuser"
}
variable "vmpassword" {
  type    = string
}
variable "vmsize" {
  type    = string
  default = "Standard_DS2_v2"
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
  default = "vnet-lamp"
}

variable "address_space" {
  type = list(string)
  default = [ "10.8.0.0/14" ]
}

variable "subnets" {
  description = "Map of subnet names and their respective CIDR ranges"
  type = map
  default = {"lamp-subnet" = "10.8.0.0/17"}
}

//------------------------------------MYSQL Configurations-------------------------------------\\
variable "db_size" {
  type        = string
  default     = "5120"
}
variable "db_name" {
  type        = string
  default     = "dblamp"
}
variable "subnet_name" {
  type        = string
  default     = "lamp-subnet"
}

variable "db_server_name" {
  type        = string
  default     = "lampservermysql"
}
variable "dbusername" {
  type        = string
  default     = "azureuser"
}
variable "dbpassword" {
  type        = string
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
