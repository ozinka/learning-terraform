resource "aws_vpc" "k-sharking-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "k-sharking-vpc"
  }
}

resource "aws_subnet" "prv_subnet" {
  cidr_block        = cidrsubnet(aws_vpc.environment-example.cidr_block, 3, 1)
  vpc_id            = aws_vpc.environment-example.id
  availability_zone = "eu-central-1b"
}

resource "aws_subnet" "subnet2" {
  cidr_block        = cidrsubnet(aws_vpc.environment-example.cidr_block, 2, 2)
  vpc_id            = aws_vpc.environment-example.id
  availability_zone = "eu-central-1c"
}

resource "aws_security_group" "subnet_security" {
  vpc_id = aws_vpc.environment-example.id

  ingress {
    cidr_blocks = [aws_vpc.environment-example.cidr_block]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
}