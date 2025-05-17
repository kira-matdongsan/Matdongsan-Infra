# RDS 보안 그룹: EC2에서만 접근 허용
resource "aws_security_group" "rds_sg" {
  name        = "matdongsan-dev-rds-sg"
  description = "Allow MySQL access from EC2"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "matdongsan-dev-rds-sg"
  }
}

# RDS Subnet Group (프라이빗 서브넷 전용)
resource "aws_db_subnet_group" "main" {
  name = "matdongsan-dev-rds-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_c.id
  ]

  tags = {
    Name = "matdongsan-dev-rds-subnet-group"
  }
}

# RDS 인스턴스 (MySQL)
resource "aws_db_instance" "mysql" {
  identifier             = "matdongsan-dev-mysql"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  port                   = 3306
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  deletion_protection    = false
  multi_az               = false

  tags = {
    Name = "matdongsan-dev-mysql"
  }
}
