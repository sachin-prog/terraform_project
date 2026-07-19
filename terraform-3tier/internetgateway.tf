#Creating internet gateway

resource "aws_internet_gateway" "main_3tier_gateway" {
    vpc_id = "${aws_vpc.vpc_3_tier.id}"
}
