/*
- EC2 creation
- To be made DRY with Terragrunt!
*/

resource "aws_instance" "ec2" {
  count                       = 4
  ami                         = "${var.ec2_ami}"
  instance_type               = "${var.ec2_instance_type}"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.sg-build.id}"]
  key_name                    = "${var.ec2_key_pair}"
  associate_public_ip_address = true

  ebs_block_device {
    device_name = "${var.ebs_block.device_name}"
    volume_size = "${var.ebs_block.volume_size}"
    volume_type = "${var.ebs_block.volume_type}"
    // encrypted                 = true
    delete_on_termination = true
  }

  tags = {
    "Name"    = "${var.env}-ec2-${count.index}"
    "Creator" = "${var.creator}"
    "Repo"    = "${var.repo}"
  }
}

