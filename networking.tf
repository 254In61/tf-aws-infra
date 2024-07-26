// 1. VPC BUILD

resource "aws_vpc" "vpc-build" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name"    = "${var.env}-vpc"
    "Creator" = "${var.creator}"
    "Repo"    = "${var.repo}"
  }
}

/*
// 2. DHCP OPTIONS 

// 2.1 : Create dhcp option

resource "aws_vpc_dhcp_options" "dns_resolver" {
  domain_name           = "${var.region}.compute.internal"
  domain_name_servers   = ["AmazonProvidedDNS"]

  tags = {
     "Name"    = "${var.env}-vpc-dns-resolver"
     "Creator" = "${var.creator}"
     "Repo"    = "${var.repo}"
  }
}

// 2.2 : Associate dhcp option to vpc

resource "aws_vpc_dhcp_options_association" "dns_resolver_vpc" {
  vpc_id          = aws_vpc.vpc-build.id
  dhcp_options_id = aws_vpc_dhcp_options.dns_resolver.id
}

*/

// 3. INTERNET GATEWAY BUILD

resource "aws_internet_gateway" "igw" {
  // Creates IGW and attaches to the vpc
  vpc_id = aws_vpc.vpc-build.id


  tags = {
    "Name"    = "${var.env}-igw"
    "Creator" = "${var.creator}"
    "Repo"    = "${var.repo}"
  }
}

// 4. SUBNETS
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc-build.id
  cidr_block        = "${var.pub_cidr}"
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env}-public-subnet"
    "Creator" = "${var.creator}"
    "Repo"    = "${var.repo}"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.vpc-build.id
  cidr_block        = "${var.priv_cidr}"
  availability_zone = "${var.region}a"

  tags = {
    "Name"    = "${var.env}-private-subnet"
    "Creator" = "${var.creator}"
    "Repo"    = "${var.repo}"
  }
}
