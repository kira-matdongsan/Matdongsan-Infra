resource "aws_ecr_repository" "ecr" {
  name = "matdongsan-dev"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name        = "matdongsan-dev"
    Environment = "matdongsan-dev"
  }
}
