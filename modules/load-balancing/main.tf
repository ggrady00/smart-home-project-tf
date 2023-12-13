resource "aws_lb" "lb" {
  name               = "services"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_security_groups
  subnets            = var.public_subnets
}

resource "aws_lb_target_group" "lighting" {
  name     = "lighting-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path     = "/api/lights/health"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "heating" {
  name     = "heating-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path     = "/api/heating/health"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "status" {
  name     = "status-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path     = "/api/status/health"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "lighting" {
  target_group_arn = aws_lb_target_group.lighting.arn
  target_id        = var.lighting_server_id
  port             = 3000
}

resource "aws_lb_target_group_attachment" "heating" {
  target_group_arn = aws_lb_target_group.heating.arn
  target_id        = var.heating_server_id
  port             = 3000
}

resource "aws_lb_target_group_attachment" "status" {
  target_group_arn = aws_lb_target_group.status.arn
  target_id        = var.status_server_id
  port             = 3000
}


resource "aws_lb_listener" "services" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.status.arn

  }
}

resource "aws_lb_listener_rule" "lighting" {
  listener_arn = aws_lb_listener.services.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lighting.arn
  }
  condition {
    path_pattern {
      values = ["/api/lights*"]
    }
  }
}

resource "aws_lb_listener_rule" "heating" {
  listener_arn = aws_lb_listener.services.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.heating.arn
  }
  condition {
    path_pattern {
      values = ["/api/heating*"]
    }
  }
}

resource "aws_lb_listener_rule" "status" {
  listener_arn = aws_lb_listener.services.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.status.arn
  }
  condition {
    path_pattern {
      values = ["/api/status*"]
    }
  }
}