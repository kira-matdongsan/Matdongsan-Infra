data "aws_iam_policy_document" "public_read_policy" {
  statement {
    sid    = "PublicRead"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::matdongsan-dev-bucket/food-story/*",
      "arn:aws:s3:::matdongsan-dev-bucket/dish/*",
      "arn:aws:s3:::matdongsan-dev-bucket/profile-image/*"
    ]
  }
}

data "aws_iam_policy_document" "internal_server_policy" {
  statement {
    sid    = "InternalServerPutRead"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::matdongsan-dev-bucket/*"
    ]
  }
}

data "aws_iam_policy_document" "merged_policy" {
  source_policy_documents = [
    data.aws_iam_policy_document.public_read_policy.json,
    data.aws_iam_policy_document.internal_server_policy.json
  ]
}

resource "aws_s3_bucket_policy" "app_bucket_policy" {
  bucket = aws_s3_bucket.app_bucket.id
  policy = data.aws_iam_policy_document.merged_policy.json
}
