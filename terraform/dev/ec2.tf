data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.amazon_linux.id # Dynamically fetch latest Amazon Linux 2 AMI
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
                   yum install -y httpd
                   systemctl start httpd
                   systemctl enable httpd
                   echo '<html><body><h1>8byte Application</h1></body></html>' > /var/www/html/index.html
                   cp /home/ec2-user/index.html /var/www/html/index.html
                   EOF
  tags = {
    Name = "8byte-web-server-dev"
  }
}