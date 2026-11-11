variable "my_ip" {
  description = "Your public ip with /32 , allowed to reach ssh,grafana and prometheus."
  type = string
}




# Create a VPC 

resource "aws_vpc" "practice_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Practice VPC"
  }
}



resource "aws_subnet" "practice_subnet" {
  vpc_id                  = aws_vpc.practice_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Practice Subnet"
  }
}


# Create an Internet Gateway

resource "aws_internet_gateway" "practice_igw" {
  vpc_id = aws_vpc.practice_vpc.id
  tags = {
    Name = "Practice Internet Gateway"
  }
}

# Create a route table
resource "aws_route_table" "practice_route_table" {
  vpc_id = aws_vpc.practice_vpc.id
  tags = {
    Name = "Practice Route Table"
  }
}
# Create a route to the Internet Gateway
resource "aws_route" "practice_route" {
  route_table_id         = aws_route_table.practice_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.practice_igw.id

}

# Route table association
resource "aws_route_table_association" "practice_route_table_association" {
  subnet_id      = aws_subnet.practice_subnet.id
  route_table_id = aws_route_table.practice_route_table.id
}

# Create a security group

resource "aws_security_group" "practice_sg" {
  name        = "practice_sg"
  description = "Allow SSH and HTTP  & HTTPS traffic"
  vpc_id      = aws_vpc.practice_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana from my ip only"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "Prometheus from my ip only"
    from_port = 9090
    to_port = 9090
    protocol = "tcp"
    cidr_blocks = [var.my_ip]
  }




  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# Create a ec2 instance
resource "aws_instance" "practice_master_instance" {
  ami                         = "ami-01a00762f46d584a1" # Replace with a valid AMI ID for your region
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.practice_subnet.id
  vpc_security_group_ids      = [aws_security_group.practice_sg.id]
  associate_public_ip_address = true
  key_name                    = "sachin-devops"
  tags = {
    Name = "Practice master instance"
  }
}
