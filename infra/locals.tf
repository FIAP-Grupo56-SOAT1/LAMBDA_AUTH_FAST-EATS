locals {
  lambdas_path = "${path.module}/lambdas"
  #layers_path  = "${path.module}/layers"

  common_tags = {
    Project   = "Lambda Authorizer FIAP 56 with Terraform"
    CreatedAt = formatdate("YYYY-MM-DD", timestamp())
    ManagedBy = "Terraform"
    Owner     = "Jairo Almires"
  }
}
