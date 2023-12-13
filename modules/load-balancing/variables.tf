variable "lb_security_groups" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
