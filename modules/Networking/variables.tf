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