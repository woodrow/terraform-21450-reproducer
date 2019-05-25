locals {
  default_inline_policy = null
  inline_policy = var.inline_policy == null ? local.default_inline_policy : var.inline_policy
}

resource "aws_iam_role" "iam_role" {
  name = var.role_name
  assume_role_policy = jsonencode({})
}

resource "aws_iam_role_policy" "iam_role-inline" {
  name = "${aws_iam_role.iam_role.id}-inline"
  role = aws_iam_role.iam_role.id
  policy = jsonencode(local.inline_policy)
  count = local.inline_policy == null ? 0 : 1
}
