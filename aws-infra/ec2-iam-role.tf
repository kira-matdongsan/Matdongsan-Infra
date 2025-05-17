resource "aws_iam_role" "ec2_access_role" {
  name = "matdongsan-dev-ec2-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
    }]
  })

  tags = {
    Name = "matdongsan-dev-ec2-access-role"
  }
}

resource "aws_iam_role_policy_attachment" "ecr_readonly_policy" {
  role       = aws_iam_role.ec2_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_policy" "s3_access_policy" {
  name = "matdongsan-dev-ec2-s3-access-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::matdongsan-dev-bucket"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = [
          "arn:aws:s3:::matdongsan-dev-bucket/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_attach_policy" {
  role       = aws_iam_role.ec2_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "matdongsan-dev-ec2-instance-profile"
  role = aws_iam_role.ec2_access_role.name
}
