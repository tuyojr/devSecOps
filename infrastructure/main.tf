resource "aws_iam_role" "main" {
  name = var.role_name
  assume_role_policy = data.aws_iam_policy_document.main.json
}

resource "aws_eks_cluster" "main" {
  name = var.cluster_name
  role_arn = aws_iam_role.main.arn
  vpc_config {
    subnet_ids = tolist(data.aws_subnets.main.ids)
  }
}