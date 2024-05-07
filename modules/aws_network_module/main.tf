data "aws_availability_zones" "available" {}

################################################################################
#                                 VPC
################################################################################
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support  = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    "Name" = "${var.tag_name}-vpc"
  }
}
################################################################################
#                       Public subnets, route table, igw
################################################################################
resource "aws_subnet" "public_subnets" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block = var.public_cidrs[count.index]


  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    "Name" = "${var.tag_name}-public-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {

  tags = {
    "Name" = "${var.tag_name}-igw"
  }
}

resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "${var.tag_name}-public_rt"
  }
}

resource "aws_route_table_association" "public_rt_ass" {
  count = length(var.public_cidrs)
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnets[count.index].id

}
################################################################################
#                    Private subnets, route table, eip, natgw
################################################################################
resource "aws_subnet" "private_subnets" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.vpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  cidr_block = var.private_cidrs[count.index]

  tags = {
    "Name" = "${var.tag_name}-private_subnet-${count.index}"
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"
  address = var.eip_cidr

  tags = {
    "Name" = "${var.tag_name}-eip"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
  tags = {
    "Name" = "${var.tag_name}-private_rt"
  }
}

resource "aws_route_table_association" "private_rt_ass" {
  count = length(var.private_cidrs)
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.private_subnets[count.index].id

}

