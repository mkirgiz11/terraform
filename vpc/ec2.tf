# EC2 instance in Public Subnet
resource "aws_instance" "web_instance" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name = "Mithat@Desktop"
  subnet_id     = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [ aws_security_group.websg.id ]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd php php-mysql
              echo "task is done" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "WebInstance"
  }
}