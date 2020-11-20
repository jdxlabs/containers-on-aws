
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_azs" {
  value = module.public_azs
}
