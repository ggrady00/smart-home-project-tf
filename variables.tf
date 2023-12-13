variable "vpc_name" {
  type = string
}

variable "public_cidrs" {
  type = list(string)
}

variable "private_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type        = string
  description = "name of the Key Pair used to connect to instance"
}

variable "server_names" {
  type = list(string)
}