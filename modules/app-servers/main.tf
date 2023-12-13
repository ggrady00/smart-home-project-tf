data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230919"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_launch_template" "services" {
  count         = length(var.ami_id)
  image_id      = var.ami_id[count.index]
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }
  user_data = base64encode(templatefile("user-data.sh", {dns = var.lb_dns}))

}

resource "aws_autoscaling_group" "services" {
  name                = var.autoscaling_group_name[count.index]
  count               = length(var.ami_id)
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.public_subnets
  launch_template {
    id      = aws_launch_template.services[count.index].id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "services" {
  count                  = length(var.ami_id)
  autoscaling_group_name = aws_autoscaling_group.services[count.index].id
  lb_target_group_arn    = var.target_group_arn[count.index]
}