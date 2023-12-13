variable "lb_security_groups" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "lighting_server_id" {
  type = string
}

variable "heating_server_id" {
  type = string
}

variable "status_server_id" {
  type = string
}