data "aws_vpc" "main" {
    filter {
      name = "tag:Name"
      values = [var.vpc_name]
    }
}

data "aws_subnets" "main" {
  filter {
    name   = var.vpc_subnet_filter_name
    values = [data.aws_vpc.main.id]
  }
}

data "aws_subnet" "main" {
  for_each = toset(data.aws_subnets.main.ids)
  id       = each.value
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}