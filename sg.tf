resource "aws_security_group" "jb_sg" {
  name   = "JumpBox-SG"
  vpc_id = aws_vpc.ksharking_vpc.id
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SG-JumpBox"
  }
}

resource "aws_security_group" "web-sg" {
  name   = "WEB-SG"
  vpc_id = aws_vpc.ksharking_vpc.id
  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.jb_sg.id]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-WEB"
  }
}

resource "aws_security_group" "rds-sg" {
  name   = "RDS-SG"
  vpc_id = aws_vpc.ksharking_vpc.id
  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.jb_sg.id, aws_security_group.web-sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-RDS"
  }
}