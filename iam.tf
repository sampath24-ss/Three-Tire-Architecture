resource "aws_iam_user" "users" {
  for_each = toset(local.users)

  name = each.value
}

locals {
  users = ["fresher-1", "fresher-2", "fresher-3"]
}

resource "aws_iam_user_policy_attachment" "s3_readonly" {
  for_each = toset(local.users)

  user       = aws_iam_user.users[each.value].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "ec2_readonly" {
  for_each = toset(local.users)

  user       = aws_iam_user.users[each.value].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}