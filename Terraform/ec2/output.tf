
output "aws_instance_public_ip" {
  value = [for i in aws_instance.ecommerce_instance : i.public_ip]
}

output "aws_instance_ids" {
  value = [for i in aws_instance.ecommerce_instance : i.id]
}

output "aws_instance_private_ips" {
  value = [for i in aws_instance.ecommerce_instance : i.private_ip]
}

output "aws_instance_private_dns" {
  value = [for i in aws_instance.ecommerce_instance : i.private_dns]
}

output "aws_instance_public_dns" {
  value = [for i in aws_instance.ecommerce_instance : i.public_dns]
}