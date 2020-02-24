resource "aws_instance" "web_server" {
  ami                         = "ami-0df0e7600ad0913a9"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet_pbl_web.id
  key_name                    = "ksharing"
  vpc_security_group_ids      = [aws_security_group.web-sg.id, aws_security_group.rds-sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "EC2-WebServer"
  }
}

resource "aws_instance" "jb_server" {
  ami                         = "ami-0df0e7600ad0913a9"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet_pbl_jb.id
  key_name                    = "ksharing"
  vpc_security_group_ids      = [aws_security_group.jb_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "EC2-JumpBox"
  }
}