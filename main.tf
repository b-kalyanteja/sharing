
# Creating  a Virtual private cloud
# Not adding any depend on task as it's small task

resource "aws_vpc" "vpc_task" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet within the VPC
resource "aws_subnet" "vpc_subnet" {
  vpc_id     = aws_vpc.vpc_task.id # once vpc is created , the id is extractd from it
  cidr_block = "10.0.1.0/24"
}

# Create a security group allowing outbound HTTP access
resource "aws_security_group" "sg_task" {
  vpc_id = aws_vpc.vpc_task.id

#outbound rules
  egress {
    from_port   = 0 #all ports allowed
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
# inbound rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Cretaing EC2 instance with CentOS
resource "aws_instance" "ec2_task" {
  ami             = var.cent # this is ami for centOS 7 
  instance_type   = "t2.micro" # type of instcne
  key_name      = var.ssh_key  # key pair created
  subnet_id       = aws_subnet.vpc_subnet.id # get id after subnet creating
  security_groups = [aws_security_group.msg_task.name] #get name from the security group - Attaching it to new VPC

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y curl
              EOF
# connction settings for ssh
  connection {
    type        = "ssh"
    user        = "kalyan"  # Username for CentOS
    private_key = file(var.file)  # Path to private key file
    host        = self.public_ip  # Public IP address of the instance
  }
}

# thi gives the Public IP of the 
output "public_ip" {
  value = aws_instance.my_instance.public_ip
}
