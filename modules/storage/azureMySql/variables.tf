variable "rgname" {
  type        = string
  default     = ""
}

variable "location" {
  type        = string
  default     = ""
}
variable "db_size" {
  type        = string
  default     = ""
}
variable "db_name" {
  type        = string
  default     = ""
}

variable "db_server_name" {
  type        = string
  default     = ""
}
variable "username" {
  type        = string
  default     = ""
}
variable "password" {
  type        = string
  default     = ""
}

//------------------------------------TAGS-------------------------\\
variable "owner" {
  type    = string
  default = "Ali"
}

variable "Environment" {
  type    = string
  default = "DEV"
}
