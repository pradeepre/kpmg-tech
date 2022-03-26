# Create VPC
resource "aws_vpc" "mVPC" {
  cidr_block = "10.0.0.0/16"
#  instance_tenancy = "default"
  tags = {
    "Name" = "My VPC"
  }
}

# Public subnet #1
resource "aws_subnet" "pubSub1" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "Public subnet 1"
  }
}

# Public subnet #2
resource "aws_subnet" "pubSub2" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "Public subnet 2"
  }
}

# App subnet #1
resource "aws_subnet" "appSub1" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = false
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "Application subnet 1"
  }
}

# App subnet #2
resource "aws_subnet" "appSub2" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "Application subnet 2"
  }
}

# DB subnet #1
resource "aws_subnet" "dbSub1" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.5.0/24"
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "DB subnet 1"
  }
}

# DB subnet #2
resource "aws_subnet" "dbSub2" {
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.6.0/24"
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "DB subnet 2"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "intGate" {
  vpc_id = "${aws_vpc.mVPC.id}"
  tags = {
    "Name" = "My Internet Gateway"
  }
}

# Create Routing table

resource "aws_route_table" "mRoute" {
  vpc_id = "${aws_vpc.mVPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.intGate.id}"
  }
  tags = {
    "Name" = "Route to Internet"
  }
}

# Create Associating Routing tables
resource "aws_route_table_association" "mRTA1" {
  subnet_id = "${aws_subnet.pubSub1.id}"
  route_table_id = "${aws_route_table.mRoute.id}"
}

resource "aws_route_table_association" "mRTA2" {
  subnet_id = "${aws_subnet.pubSub2.id}"
  route_table_id = "${aws_route_table.mRoute.id}"
}