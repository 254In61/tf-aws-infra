// region
variable "region" {
  description = "AWS region"
  type        = string
}

// vpc
variable "vpc_cidr" {
  description = "VPC cidr"
  type        = string
}

// network details

variable "pub_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "priv_cidr" {
  description = "Private subnet CIDR"
  type        = string
}



// machine details

variable "ec2_ami" {
  description = "AWS AMI used"
  type        = string
}

variable "ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
}


// key pair
variable "ec2_key_pair" {
  description = " EC2 key pair"
  type        = string
}


// storage
variable "ebs_block" {
  description = "Ebs block device details"
  type        = map(any)
}

// tags
variable "env" {
  description = "environment identifier"
  type        = string
}

variable "repo" {
  description = "Git repository"
  type        = string
}

variable "creator" {
  description = "Resources creator"
  type        = string
}
