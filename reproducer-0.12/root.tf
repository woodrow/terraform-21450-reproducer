provider "aws" {
  region  = "us-east-1"
}

module "test_role" {
  source = "./modules/iam_role"
  role_name = "test_role"
}

module "test_role_with_inline" {
  source = "./modules/iam_role"
  role_name = "test_role_with_inline"
  inline_policy = {}
}
