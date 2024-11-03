variable "region" {
  description = "The region in which the resources will be created"
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  default     = "default"
}

variable "vpc_subnet_filter_name" {
  description = "The filter name for the VPC subnets"
  default     = "vpc-id"  
}

variable "role_name" {
  description = "IAM role name"
  default = "aws_iam_role_by_terraform"
}

variable "cluster_name" {
  description = "AWS EKS Cluster name"
  default = "aws_eks_cluster_by_terraform"
}