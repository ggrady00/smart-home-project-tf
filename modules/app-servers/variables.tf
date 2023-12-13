variable "instance_type" {
  type = string
}

variable "public_subnets" {
  type        = list(string)
  description = "subnet id that server will be hosted on"
}

variable "key_name" {
  type        = string
  description = "name of the Key Pair used to connect to instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "list of security groups to apply to instance"
}


variable "max_size" {
  type = string
}

variable "min_size" {
  type = string
}

variable "desired_capacity" {
  type = string
}

variable "target_group_arn" {
  type = list(string)
}

variable "ami_id" {
  type = list(string)
}

variable "autoscaling_group_name" {
  type = list(string)
}

variable "lb_dns" {
  type = string
}