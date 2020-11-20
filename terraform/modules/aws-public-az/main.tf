
resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name        = "${var.vpc_name}-${element(var.availability_zones, count.index)}-public"
    Description = "${var.vpc_name} public subnet in AZ ${element(var.availability_zones, count.index)}"
  }
}

resource "aws_route_table_association" "public_subnet_to_gateway" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(split(",", join(",", aws_subnet.public_subnet.*.id)), count.index)
  route_table_id = var.public_gateway_route_table_id
}
