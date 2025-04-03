variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the EC2 instance"
  type        = string
}

resource "aws_instance" "web" {
  ami                    = "ami-0c94855ba95c71c99"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "TerraformEC2"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
