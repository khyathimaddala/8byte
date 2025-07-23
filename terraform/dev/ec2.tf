data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_a.id
  security_groups = [aws_security_group.web_sg.id]
  user_data       = <<-EOF
                   #!/bin/bash
                   yum update -y
                   yum install -y amazon-ssm-agent
                   systemctl enable amazon-ssm-agent
                   systemctl start amazon-ssm-agent
                   yum install -y docker
                   systemctl start docker
                   systemctl enable docker
                   yum remove -y httpd
                   EOF
  tags = {
    Name = "8byte-web-server-dev"
  }
}