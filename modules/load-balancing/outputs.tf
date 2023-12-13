output "tg_arn" {
  value = [aws_lb_target_group.lighting.arn, aws_lb_target_group.heating.arn, aws_lb_target_group.status.arn]
}