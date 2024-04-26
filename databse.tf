resource "aws_db_subnet_group" "mydbsubnet" {
  name       = "myrdsdb"
  subnet_ids = [aws_subnet.web1[4].id, aws_subnet.web1[0].id]
}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.mydbsubnet.name
}