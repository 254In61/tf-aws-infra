/*  
- A load balancer

resource "aws_elb" "lab-elb" {
  name                      = "lab-elb"
  security_groups           = ["${aws_security_group.sg-build.id}"]
  subnets                   = ["${aws_subnet.public-subnet.id}"]
  cross_zone_load_balancing = true
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTPS:443/"
  }

  listener {
    lb_port           = 8443
    lb_protocol       = "tcp"
    instance_port     = "8443"
    instance_protocol = "tcp"
  }

  tags = {
    Name        = "${var.env}-elb"
    Creator     = "amaseghe"
    Repo        = "tf-aws-infra"
  }
}

*/