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

variable "min_size" {
  type = string
}
variable "max_size" {
  type = string
}
variable "desired_capacity" {
  type = string
}
variable "ami_id" {
  type = list(string)
}

variable "autoscaling_group_name" {
  type = list(string)
}