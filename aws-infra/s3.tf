# S3 버킷 생성
resource "aws_s3_bucket" "app_bucket" {
  bucket        = "matdongsan-dev-bucket"
  force_destroy = true

  tags = {
    Name = "matdongsan-dev-bucket"
  }
}

# 버킷 퍼블릭 접근 차단 (기본 설정 강화)
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

# VPC Gateway Endpoint for S3
resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-northeast-2.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.public_rt.id
  ]

  tags = {
    Name = "matdongsan-dev-s3-endpoint"
  }
}
