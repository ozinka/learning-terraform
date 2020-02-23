resource "aws_security_group" "jb_sg" {
  vpc_id = aws_vpc.ksharking_vpc.id
}

resource "aws_security_group" "web-sg" {
  vpc_id = aws_vpc.ksharking_vpc.id
}

resource "aws_security_group" "rds-sg" {
  vpc_id = aws_vpc.ksharking_vpc.id
}