/*
Create security security security group 
*/

resource "aws_security_group" "sg-build" {
  name   = "${var.env}-lab-sg"
  vpc_id = aws_vpc.vpc-build.id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"    = "${var.env}-sec-grp"
    "Creator" = "${var.creator}"
    "Repo"    = "${var.repo}"
  }
}

