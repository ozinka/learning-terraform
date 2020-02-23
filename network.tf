resource "aws_vpc" "ksharking_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "k-sharking-vpc"
  }
}

resource "aws_subnet" "subnet_prv" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.ksharking_vpc.id
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_subnet" "subnet_pbl" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.ksharking_vpc.id
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.ksharking_vpc.id
}