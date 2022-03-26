# Create Public EC2 instances

resource "aws_instance" "mInstance1" {
  ami = "ami-011a9944eb4abcf55"
  associate_public_ip_address = true
#  count = 1
  instance_type = "t2.micro"
  key_name = "mKey"
  subnet_id = "${aws_subnet.pubSub1.id}"
  vpc_security_group_ids = ["${aws_security_group.pubSG.id}"]
  tags = {
    "Name" = "Public instance 1"
  }
}

resource "aws_instance" "mInstance2" {
  ami = "ami-011a9944eb4abcf55"
  associate_public_ip_address = true
#  count = 1
  instance_type = "t2.micro"
  key_name = "mKey"
  subnet_id = "${aws_subnet.pubSub1.id}"
  vpc_security_group_ids = ["${aws_security_group.pubSG.id}"]
  tags = {
    "Name" = "Public instance 2"
  }
}

# Create RDS Instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${aws_subnet.dbSub1.id}", "${aws_subnet.dbSub2.id}"]

  tags = {
    Name = "My priv(DB) subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "mDB"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = ["${aws_security_group.privSG.id}"]
}