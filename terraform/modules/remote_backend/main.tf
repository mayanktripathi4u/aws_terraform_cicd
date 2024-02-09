# IAM User for Terraform
resource "aws_iam_user" "terraform_user" {
  name = var.iam_user_name
}

# Attach administrator Access policy to the IAM User
resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    user = aws_iam_user.terraform_user.id
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.bucket_name
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name    = ""
  }
}