# VPC 생성
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "matdongsan-dev-vpc"
    Environment = "matdongsan-dev"
  }
}

# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "matdongsan-dev-igw"
  }
}

# 퍼블릭 서브넷 (AZ A)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "matdongsan-dev-public-subnet"
  }
}

# 프라이빗 서브넷 (AZ A)
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "matdongsan-dev-private-subnet-a"
  }
}

# 프라이빗 서브넷 (AZ C)
resource "aws_subnet" "private_subnet_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "matdongsan-dev-private-subnet-c"
  }
}

# 퍼블릭 라우트 테이블
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "matdongsan-dev-public-rt"
  }
}

# 퍼블릭 서브넷 ↔ 라우트 테이블 연결
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}