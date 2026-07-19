#Creating Route table 


resource "aws_route_table" "route-3-tier" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"

    route {
            cidr_block = "0.0.0.0/0"
            gateway_id = "${aws_internet_gateway.main_3tier_gateway.id}"
        }
    tags = {

        Name = "Route to internet"
    
    }
}

#Associating the Route table

resource "aws_route_table_association" "route1" {
    subnet_id = "${aws_subnet.public-web-subnet-1.id}"
    route_table_id = "${aws_route_table.route-3-tier.id}"
}


#Associating the another Route table 

resource "aws_route_table_association" "route2" {
    subnet_id = "${aws_subnet.public-web-subnet-2.id}"
    route_table_id = "${aws_route_table.route-3-tier.id}"
}
