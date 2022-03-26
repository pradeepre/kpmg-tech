# Create public Security Group

resource "aws_security_group" "pubSG" {
  vpc_id = "${aws_vpc.mVPC.id}"
  description = "Allow inbound traffic from anywhere for SSH, HTTP & HTTPS"
  tags = {
    "Name" = "SG for Public instance"
  }

  # InBound rules
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create public Security Group

resource "aws_security_group" "privSG" {
  vpc_id = "${aws_vpc.mVPC.id}"
  description = "Allow inbound traffic from application layer"
  tags = {
    "Name" = "SG for private(DB) instance"
  }

  # InBound rules
  ingress {
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"
    security_groups = ["${aws_security_group.pubSG.id}"]
  }
  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}