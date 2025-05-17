resource "aws_iam_user" "admin_user" {
  name          = var.iam_user_name
  force_destroy = true
}

resource "aws_iam_user_group_membership" "admin_membership" {
  user   = aws_iam_user.admin_user.name
  groups = [var.iam_user_groups_name]
}

resource "aws_iam_user_login_profile" "admin_console_login" {
  user                    = aws_iam_user.admin_user.name
  password_length         = 16
  password_reset_required = true
}
