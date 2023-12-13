output "lighting_server_id" {
  value = aws_instance.server[0].id    
}

output "heating_server_id" {
  value = aws_instance.server[1].id    
}

output "status_server_id" {
  value = aws_instance.server[2].id    
}