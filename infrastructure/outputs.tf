output "vpc-id" {
  value = data.aws_vpc.main.id
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.main : s.cidr_block]
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}