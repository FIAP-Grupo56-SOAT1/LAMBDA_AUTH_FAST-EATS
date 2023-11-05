locals {
  common_tags = {
    Project   = "Lambda Authorizer FIAP 56 with Terraform"
    CreatedAt = formatdate("YYYY-MM-DD", timestamp())
    ManagedBy = "Terraform"
    Owner     = "fiap56soat1"
  }
}
