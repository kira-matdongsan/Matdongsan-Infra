variable "iam_user_name" {
  default = "hyein-admin"
}

variable "iam_user_groups_name" {
  default = "admin-group"
}

variable "db_name" {
  default = "matdongsan"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
