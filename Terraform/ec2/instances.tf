resource "aws_key_pair" "ecommerce_key" {
  key_name   = "ecommerce_key"
  public_key = file("${path.module}/ecommerce-key.pub")
}
resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "default_vpc"
  }
}
resource "aws_security_group" "ecommerce_sg" {
  name        = "ecommerce_sg"
  description = "Security group for ecommerce instances"
  vpc_id      = aws_default_vpc.default_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.ecommerce_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  description = "Allow HTTP traffic from internal network"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.ecommerce_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  description = "Allow SSH traffic from internal network"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.ecommerce_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
  description = "Allow HTTPs traffic from internal network"
}

resource "aws_vpc_security_group_ingress_rule" "jenkins" {
  security_group_id = aws_security_group.ecommerce_sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  description = "Allow Jenkins traffic from internal network"
}

resource "aws_vpc_security_group_ingress_rule" "kubernetes" {
  security_group_id = aws_security_group.ecommerce_sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 30000
  ip_protocol = "tcp"
  to_port     = 32767
  description = "Allow Kubernetes traffic from internal network"
}
resource "aws_instance" "ecommerce_instance" {
  for_each               = toset(["ecommerce-instance-1", "ecommerce-instance-2", "ecommerce-instance-3"])
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ecommerce_key.key_name
  vpc_security_group_ids = [aws_security_group.ecommerce_sg.id]
  user_data              = file("${path.module}/install.sh")


  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
  tags = {
    Name = each.key
  }
}