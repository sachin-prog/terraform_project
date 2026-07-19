#Creating 1st Web Subnet 


resource "aws_subnet" "public-web-subnet-1" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
    cidr_block = "${var.subnet_cidr}"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
    Name = "Web Subnet 1"
    }
  }

#creating 2nd Web Subnet

resource "aws_subnet" "public-web-subnet-2" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
    cidr_block = "${var.subnet1_cidr}"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"

    tags = {
    Name = "Web Subnet 2"
    }
}


#Creating 1st Application Subnet

resource "aws_subnet" "application-subnet-1" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
    cidr_block = "${var.subnet2_cidr}"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
    Name = "App Subnet 1"
    }
}

#Creating 2nd Application Subnet 

resource "aws_subnet" "application-subnet-2" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
    cidr_block = "${var.subnet3_cidr}"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"
     
    tags = {
    Name = "App Subnet 2"
    }
}


#Create Database 1st Private Subnet

resource "aws_subnet" "database-subnet-1" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
    cidr_block = "${var.subnet4_cidr}"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"

    tags = {
    Name = "Database Subnet 1"
    }
}

#Create Database 2nd Private subnet

resource "aws_subnet" "database-subnet-2" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
    cidr_block = "${var.subnet5_cidr}"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"

    tags = {
    Name = "Database Subnet 2"
    }

}

