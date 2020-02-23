resource "aws_db_instance" "web-mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "mydb"
  username               = "foo"
  password               = "foobarbaz"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.rds-sg.id
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
}


resource "aws_db_subnet_group" "rds-sg" {
  subnet_ids = [aws_subnet.subnet_prv.id, aws_subnet.subnet_pbl.id]
}