provider "aws" {
  region = "us-east-1"
}

# Define a security group with Inbound rules

resource "aws_security_group" "instance_sg" {
  name = "Instance_Security_Group"
  description = "Allow SSH, HTTP , HTTPS , Prometheus, Alert manager, Blackbox Exporter, Node Exporter and Email transmissions inbound traffic"
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   ingress {
    from_port   = 587
    to_port     = 587
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   ingress {
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }

   ingress {
    from_port   = 9115
    to_port     = 9115
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH access from any IP. Adjust this for your needs.
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "master" {
     ami           = "ami-080e1f13689e07408"  # Specify an appropriate AMI ID
     instance_type = "t2.micro"
     security_groups = [aws_security_group.instance_sg.name]
      tags = {
        Name = "Master_Instance"

      }
   }

resource "aws_instance" "worker" {
     ami           = "ami-080e1f13689e07408"  # Specify an appropriate AMI ID
     instance_type = "t2.micro"
      tags = {
        Name = "Worker_Instance"
      }
   }