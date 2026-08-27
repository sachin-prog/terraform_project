provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "practice_instance" {
  ami           = "ami-01a00762f46d584a1" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"

  tags = {
    Name = "Practice EC2 Instance"
  }
}
