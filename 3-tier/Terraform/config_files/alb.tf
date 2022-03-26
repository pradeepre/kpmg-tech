# Create External LoadBalancer
resource "aws_lb" "mLB" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.pubSG.id}"]
  subnets            = ["${aws_subnet.pubSub1.id}", "${aws_subnet.pubSub2.id}"]
}

resource "aws_lb_target_group" "tLB" {
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.mVPC.id}"
}

resource "aws_lb_target_group_attachment" "mAttachment1" {
  target_group_arn = "${aws_lb_target_group.tLB.arn}"
  target_id        = "${aws_instance.mInstance1.id}"
  port             = "80"

  depends_on = [
    aws_instance.mInstance1,
  ]
}

resource "aws_lb_target_group_attachment" "mAttachment2" {
  target_group_arn = "${aws_lb_target_group.tLB.arn}"
  target_id        = "${aws_instance.mInstance2.id}"
  port             = "80"

  depends_on = [
    aws_instance.mInstance2,
  ]
}

resource "aws_lb_listener" "mELB" {
  load_balancer_arn = "${aws_lb.mLB.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tLB.arn
  }
}
