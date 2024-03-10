
resource "aws_db_instance" "rds" {
  identifier           = "rds-mysql-instance"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7.41"
  instance_class       = "db.t3.micro"
  db_name                = "myDB"
  username             = "admin"
  password             = "mypassword"
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name    = aws_db_subnet_group.rds.id
  multi_az             = false
  skip_final_snapshot = true
 
}
