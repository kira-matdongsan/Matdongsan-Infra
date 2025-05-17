# # 보안 그룹: SSH (내 IP만), HTTP (모두 허용)
# data "http" "my_ip" {
#   url = "https://checkip.amazonaws.com/"
# }

# 보안 그룹 설정
resource "aws_security_group" "ec2_sg" {
  name        = "matdongsan-dev-ec2-sg"
  description = "Allow SSH (My IP) and HTTP (80)"
  vpc_id      = aws_vpc.main.id

  # ingress {
  #   description = "SSH from my IP only"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["${chomp(data.http.my_ip.body)}/32"]
  # }

  ingress {
    description = "SSH from anywhere (for CI/CD testing)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP for API/Swagger"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS for API/Swagger"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "matdongsan-dev-ec2-sg"
  }
}

# SSH 키페어 등록
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/terraform-key.pub")
}

# EC2 인스턴스 생성
resource "aws_instance" "spring_server" {
  ami                         = "ami-0f605570d05d73472" # Amazon Linux 2023 AMI (서울 리전)
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = aws_key_pair.terraform_key.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "matdongsan-dev"
  }
}

resource "aws_eip" "spring_eip" {
  instance = aws_instance.spring_server.id

  tags = {
    Name = "matdongsan-dev-eip"
  }
}
